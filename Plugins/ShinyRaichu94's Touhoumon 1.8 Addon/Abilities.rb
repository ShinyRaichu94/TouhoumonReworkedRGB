#===============================================================================
# Ability Effect Handlers
#===============================================================================
module Battle::AbilityEffects
  OnOpposingStatGain      = AbilityHandlerHash.new  # Jealousy

  def self.triggerOnOpposingStatGain(ability, battler, battle, statUps)
    OnOpposingStatGain.trigger(ability, battler, battle, statUps)
  end
end

#-------------------------------------------------------------------------------
# Fire Veil (Update)
#-------------------------------------------------------------------------------
Battle::AbilityEffects::DamageCalcFromTarget.add(:FIREVEIL,
  proc { |ability, user, target, move, mults, power, type|
    mults[:power_multiplier] /= 2 if type == :WATER
  }
)

#-------------------------------------------------------------------------------
# Fretful (Update)
#-------------------------------------------------------------------------------
Battle::AbilityEffects::DamageCalcFromUser.add(:FRETFUL,
  proc { |ability, user, target, move, mults, power, type|
    mults[:attack_multiplier] *= 1.2
  }
)

#-------------------------------------------------------------------------------
# Inner Power
#-------------------------------------------------------------------------------
Battle::AbilityEffects::DamageCalcFromUser.add(:INNERPOWER,
  proc { |ability, user, target, move, mults, power, type|
    if user.hp <= user.totalhp / 3 && type == :DREAM
      mults[:attack_multiplier] *= 1.5
    end
  }
)

Battle::AI::Handlers::AbilityRanking.add(:INNERPOWER,
  proc { |ability, score, battler, ai|
    next score if battler.has_damaging_move_of_type?(:DREAM)
    next 0
  }
)

#-------------------------------------------------------------------------------
# Jealousy (Update) (From Gen 9)
#-------------------------------------------------------------------------------
Battle::AbilityEffects::OnOpposingStatGain.add(:JEALOUSY,
  proc { |ability, battler, battle, statUps|
    showAnim = true
    battle.pbShowAbilitySplash(battler)
    statUps.each do |stat, increment|
	    next if !battler.pbCanRaiseStatStage?(stat, battler)
      if battler.pbRaiseStatStage(stat, increment, battler, showAnim)
        showAnim = false
      end
    end
    battle.pbDisplay(_INTL("{1}'s stats won't go any higher!", battler.pbThis)) if showAnim
    battle.pbHideAbilitySplash(battler)
    battler.pbItemOpposingStatGainCheck(statUps)
    # Mirror Herb can trigger off this ability.
    if !showAnim 
      opposingStatUps = battle.sideStatUps[battler.idxOwnSide]
      battle.allOtherSideBattlers(battler.index).each do |b|
        next if !b || b.fainted?
        if b.itemActive?
          b.pbItemOpposingStatGainCheck(opposingStatUps)
        end
      end
      opposingStatUps.clear
    end
  }
)

#-------------------------------------------------------------------------------
# Lightning Rod (Touhoumon Version)
#-------------------------------------------------------------------------------
Battle::AbilityEffects::MoveImmunity.add(:LIGHTNINGROD,
  proc { |ability, user, target, move, type, battle, show_message|
    next target.pbMoveImmunityStatRaisingAbility(user, move, type,
       :WIND, :SPECIAL_ATTACK, 1, show_message)
  }
)

Battle::AbilityEffects::AccuracyCalcFromTarget.add(:LIGHTNINGROD,
  proc { |ability, mods, user, target, move, type|
    mods[:base_accuracy] = 0 if type == :WIND
  }
)

#-------------------------------------------------------------------------------
# Overgrow (Touhoumon Version)
#-------------------------------------------------------------------------------
Battle::AbilityEffects::DamageCalcFromUser.add(:OVERGROW,
  proc { |ability, user, target, move, mults, power, type|
    if user.hp <= user.totalhp / 3 && type == :NATURE
      mults[:attack_multiplier] *= 1.5
    end
  }
)

Battle::AI::Handlers::AbilityRanking.add(:OVERGROW,
  proc { |ability, score, battler, ai|
    next score if battler.has_damaging_move_of_type?(:NATURE)
    next 0
  }
)

#-------------------------------------------------------------------------------
# Plus & Minus (Update)
#-------------------------------------------------------------------------------
Battle::AbilityEffects::DamageCalcFromUser.add(:MINUS,
  proc { |ability, user, target, move, mults, power, type|
    next if !move.specialMove?
    mults[:attack_multiplier] *= 1.1
  }
)

Battle::AbilityEffects::DamageCalcFromUser.copy(:MINUS, :PLUS)

Battle::AbilityEffects::DamageCalcFromAlly.add(:MINUS,
  proc { |ability, user, target, move, mults, power, type|
    next if !move.specialMove?
    mults[:attack_multiplier] *= 1.1
  }
)

Battle::AbilityEffects::DamageCalcFromAlly.copy(:MINUS, :PLUS)

#-------------------------------------------------------------------------------
# Volt Absorb (Touhoumon Version)
#-------------------------------------------------------------------------------
Battle::AbilityEffects::MoveImmunity.add(:VOLTABSORB,
  proc { |ability, user, target, move, type, battle, show_message|
    next target.pbMoveImmunityHealingAbility(user, move, type, :WIND, show_message)
  }
)

#-------------------------------------------------------------------------------
# Touhoumon Ability Handlers
#-------------------------------------------------------------------------------
Battle::AbilityEffects::CriticalCalcFromTarget.copy(:BATTLEARMOR, :SHELLARMOR, :GUARDARMOR) # Guard Armor
Battle::AbilityEffects::OnSwitchIn.copy(:AIRLOCK, :CLOUDNINE, :UNCONSCIOUS, :HISOUTEN) # Unconscious & Hisouten
Battle::AbilityEffects::AccuracyCalcFromUser.copy(:COMPOUNDEYES, :FOCUS) # Focus
Battle::AbilityEffects::AfterMoveUseFromTarget.copy(:COLORCHANGE, :MYSTERIOUS) # Mysterious
Battle::AbilityEffects::OnBeingHit.copy(:IRONBARBS, :ROUGHSKIN, :DOLLWALL) # Doll Wall
Battle::AbilityEffects::MoveImmunity.copy(:WONDERGUARD, :PLAYGHOST) # Play Ghost
Battle::AbilityEffects::OnBeingHit.copy(:EFFECTSPORE, :INFECTIOUS) # Infectious
Battle::AbilityEffects::StatLossImmunity.copy(:CLEARBODY, :WHITESMOKE, :HAKUREIMIKO, :MAGICBARRIER) # Hakurei Miko & Magic Barrier
Battle::AbilityEffects::DamageCalcFromUser.copy(:HUGEPOWER, :PUREPOWER, :UNZAN) # Unzan
Battle::AbilityEffects::OnBeingHit.copy(:POISONPOINT, :POISONBODY) # Poison Body
Battle::AbilityEffects::StatusImmunity.copy(:MAGMAARMOR, :FIREVEIL) # Fire Veil
Battle::AbilityEffects::StatusCure.copy(:MAGMAARMOR, :FIREVEIL)
Battle::AbilityEffects::OnSwitchOut.copy(:MAGMAARMOR, :FIREVEIL)
Battle::AbilityEffects::DamageCalcFromTarget.copy(:THICKFAT, :WALLOFICE) # Wall of Ice
Battle::AbilityEffects::StatLossImmunity.copy(:HYPERCUTTER, :HIGHSTRENGTH) # High Strength
Battle::AbilityEffects::EndOfRoundHealing.copy(:SHEDSKIN, :MAINTENANCE) # Maintenance
Battle::AbilityEffects::DamageCalcFromTarget.copy(:MARVELSCALE, :SPRINGCHARM) # Spring Charm
