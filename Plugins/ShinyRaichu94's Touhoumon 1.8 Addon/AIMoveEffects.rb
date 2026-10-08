#===============================================================================
#
#===============================================================================
Battle::AI::Handlers::MoveFailureCheck.add("StartSunWeather",
  proc { |move, user, ai, battle|
    next [:HarshSun, :HeavyRain, :StrongWinds, move.move.weatherType].include?(battle.field.weather)
  }
)
Battle::AI::Handlers::MoveEffectScore.add("StartSunWeather",
  proc { |score, move, user, ai, battle|
    next Battle::AI::MOVE_USELESS_SCORE if battle.pbCheckGlobalAbility(:AIRLOCK) ||
                                           battle.pbCheckGlobalAbility(:CLOUDNINE) ||
                                           battle.pbCheckGlobalAbility(:HISOUTEN) ||
                                           battle.pbCheckGlobalAbility(:UNCONSCIOUS)
    # Not worth it at lower HP
    if ai.trainer.has_skill_flag?("HPAware")
      score -= 10 if user.hp < user.totalhp / 2
    end
    if ai.trainer.has_skill_flag?("Blaine") && battle.field.weather != :Sun
      score += 10
    end
    if ai.trainer.high_skill? && battle.field.weather != :None
      score -= ai.get_score_for_weather(battle.field.weather, user)
    end
    score += ai.get_score_for_weather(:Sun, user, true)
    next score
  }
)

#===============================================================================
#
#===============================================================================
Battle::AI::Handlers::MoveFailureCheck.copy("StartSunWeather",
                                            "StartRainWeather")
Battle::AI::Handlers::MoveEffectScore.add("StartRainWeather",
  proc { |score, move, user, ai, battle|
    next Battle::AI::MOVE_USELESS_SCORE if battle.pbCheckGlobalAbility(:AIRLOCK) ||
                                           battle.pbCheckGlobalAbility(:CLOUDNINE) ||
                                           battle.pbCheckGlobalAbility(:HISOUTEN) ||
                                           battle.pbCheckGlobalAbility(:UNCONSCIOUS)
    # Not worth it at lower HP
    if ai.trainer.has_skill_flag?("HPAware")
      score -= 10 if user.hp < user.totalhp / 2
    end
    if ai.trainer.high_skill? && battle.field.weather != :None
      score -= ai.get_score_for_weather(battle.field.weather, user)
    end
    score += ai.get_score_for_weather(:Rain, user, true)
    next score
  }
)

#===============================================================================
#
#===============================================================================
Battle::AI::Handlers::MoveFailureCheck.copy("StartSunWeather",
                                            "StartSandstormWeather")
Battle::AI::Handlers::MoveEffectScore.add("StartSandstormWeather",
  proc { |score, move, user, ai, battle|
    next Battle::AI::MOVE_USELESS_SCORE if battle.pbCheckGlobalAbility(:AIRLOCK) ||
                                           battle.pbCheckGlobalAbility(:CLOUDNINE) ||
                                           battle.pbCheckGlobalAbility(:HISOUTEN) ||
                                           battle.pbCheckGlobalAbility(:UNCONSCIOUS)
    # Not worth it at lower HP
    if ai.trainer.has_skill_flag?("HPAware")
      score -= 10 if user.hp < user.totalhp / 2
    end
    if ai.trainer.high_skill? && battle.field.weather != :None
      score -= ai.get_score_for_weather(battle.field.weather, user)
    end
    score += ai.get_score_for_weather(:Sandstorm, user, true)
    next score
  }
)

#===============================================================================
#
#===============================================================================
Battle::AI::Handlers::MoveFailureCheck.copy("StartSunWeather",
                                            "StartHailWeather")
Battle::AI::Handlers::MoveEffectScore.add("StartHailWeather",
  proc { |score, move, user, ai, battle|
    next Battle::AI::MOVE_USELESS_SCORE if battle.pbCheckGlobalAbility(:AIRLOCK) ||
                                           battle.pbCheckGlobalAbility(:CLOUDNINE) ||
                                           battle.pbCheckGlobalAbility(:HISOUTEN) ||
                                           battle.pbCheckGlobalAbility(:UNCONSCIOUS)
    # Not worth it at lower HP
    if ai.trainer.has_skill_flag?("HPAware")
      score -= 10 if user.hp < user.totalhp / 2
    end
    if ai.trainer.has_skill_flag?("Lorelei") && battle.field.weather != :Hail
      score += 10 if user.has_type?(:ICE)
    end
    if ai.trainer.high_skill? && battle.field.weather != :None
      score -= ai.get_score_for_weather(battle.field.weather, user)
    end
    score += ai.get_score_for_weather(:Hail, user, true)
    next score
  }
)

#===============================================================================
#
#===============================================================================
Battle::AI::Handlers::MoveEffectScore.add("BurnUser",
  proc { |score, move, user, target, ai, battle|
    useless_score = (move.statusMove?) ? Battle::AI::MOVE_USELESS_SCORE : score
    if user.battler.pbCanBurn?(user.battler, false, move.move)
      add_effect = move.get_score_change_for_additional_effect(user, target)
      next useless_score if add_effect == -999   # Additional effect will be negated
      score += add_effect
      # Inherent preference
      score += 15
      if user.has_active_ability?(:GUTS) && user.check_for_move { |m| m.physicalMove? }
        score += 8
        score += 8 if user.check_for_move { |m| m.specialMove? }
      end
      score += 8 if user.has_active_ability?([:FLAREBOOST, :GUTS, :MARVELSCALE, :QUICKFEET, :SPRINGCHARM])
      score += 5 if user.has_active_ability?(:HEATPROOF)
      score += 5 if user.has_move_with_function?("DoublePowerIfUserPoisonedBurnedParalyzed",
                                                   "CureUserBurnPoisonParalysis")
      score += 15 if user.check_for_move { |m|
        m.function_code == "GiveUserStatusToTarget" && user.battler.pbCanBurn?(target.battler, false, m)
      }
      if user.has_active_ability?([:SHEDSKIN, :MAINTENANCE])
        score += 8
      end
    end
    next score
  }
)

#===============================================================================
#
#===============================================================================
Battle::AI::Handlers::MoveFailureAgainstTargetCheck.add("StartLeechSeedTarget",
  proc { |move, user, target, ai, battle|
    next true if target.effects[PBEffects::LeechSeed] >= 0
    next true if target.has_type?(:NATURE) || !target.battler.takesIndirectDamage?
    next false
  }
)
Battle::AI::Handlers::MoveEffectAgainstTargetScore.add("StartLeechSeedTarget",
  proc { |score, move, user, target, ai, battle|
    score += 15
    # Prefer early on
    score += 10 if user.turnCount < 2
    if ai.trainer.medium_skill?
      # Prefer if the user has no damaging moves
      score += 10 if !user.check_for_move { |m| m.damagingMove? }
      # Prefer if the target can't switch out to remove its seeding
      score += 8 if !battle.pbCanChooseNonActive?(target.index)
      # Don't prefer if the leeched HP will hurt the user
      score -= 20 if target.has_active_ability?([:STRANGEMIST])
    end
    if ai.trainer.high_skill?
      # Prefer if user can stall while damage is dealt
      if user.check_for_move { |m| m.is_a?(Battle::Move::ProtectMove) }
        score += 10
      end
      # Don't prefer if target can remove the seed
      if target.has_move_with_function?("RemoveUserBindingAndEntryHazards")
        score -= 15
      end
    end
    next score
  }
)
