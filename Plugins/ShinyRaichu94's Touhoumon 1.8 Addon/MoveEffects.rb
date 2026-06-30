#===============================================================================
# Beat Up (Update)
#===============================================================================
class Battle::Move::HitOncePerUserTeamMember < Battle::Move
  def multiHitMove?; return true; end

  def pbMoveFailed?(user, targets)
    @beatUpList = []
    @battle.eachInTeamFromBattlerIndex(user.index) do |pkmn, i|
      next if !pkmn.able? || pkmn.status != :NONE
      @beatUpList.push(i)
    end
    if @beatUpList.length == 0
      @battle.pbDisplay(_INTL("But it failed!"))
      return true
    end
    return false
  end

  def pbNumHits(user, targets)
    return @beatUpList.length
  end

  def pbBaseDamage(baseDmg, user, target)
    i = @beatUpList.shift   # First element in array, and removes it from array
    atk = @battle.pbParty(user.index)[i].baseStats[:ATTACK]
    return 10 + (atk / 10)
  end
end

#===============================================================================
# Rage (Touhoumon Version)
#===============================================================================
class Battle::Move::BurnUser < Battle::Move
  def pbEffectAgainstTarget(user, target)
    user.pbBurn(user)
  end

  def pbAdditionalEffect(user, target)
    return if user.damageState.substitute
    user.pbBurn(user) if user.pbCanBurn?(user, false, self)
  end
end

#===============================================================================
# Rapid Spin/Twister (Touhoumon Version)
#===============================================================================
class Battle::Move::RemoveUserBindingAndEntryHazards < Battle::Move::StatUpMove
  def initialize(battle, move)
    super
    @statUp = [:SPEED, 1]
  end

  def pbEffectAfterAllHits(user, target)
    return if user.fainted? || target.damageState.unaffected
    if user.effects[PBEffects::Trapping] > 0
      trapMove = GameData::Move.get(user.effects[PBEffects::TrappingMove]).name
      trapUser = @battle.battlers[user.effects[PBEffects::TrappingUser]]
      @battle.pbDisplay(_INTL("{1} got free of {2}'s {3}!", user.pbThis, trapUser.pbThis(true), trapMove))
      user.effects[PBEffects::Trapping]     = 0
      user.effects[PBEffects::TrappingMove] = nil
      user.effects[PBEffects::TrappingUser] = -1
    end
    if user.effects[PBEffects::LeechSeed] >= 0
      user.effects[PBEffects::LeechSeed] = -1
      @battle.pbDisplay(_INTL("{1} shed Leech Seed!", user.pbThis))
    end
    if user.pbOwnSide.effects[PBEffects::StealthRock]
      user.pbOwnSide.effects[PBEffects::StealthRock] = false
      @battle.pbDisplay(_INTL("{1} blew away stealth rocks!", user.pbThis))
    end
    if user.pbOwnSide.effects[PBEffects::Spikes] > 0
      user.pbOwnSide.effects[PBEffects::Spikes] = 0
      @battle.pbDisplay(_INTL("{1} blew away spikes!", user.pbThis))
    end
    if user.pbOwnSide.effects[PBEffects::ToxicSpikes] > 0
      user.pbOwnSide.effects[PBEffects::ToxicSpikes] = 0
      @battle.pbDisplay(_INTL("{1} blew away poison spikes!", user.pbThis))
    end
    if user.pbOwnSide.effects[PBEffects::StickyWeb]
      user.pbOwnSide.effects[PBEffects::StickyWeb] = false
      @battle.pbDisplay(_INTL("{1} blew away sticky webs!", user.pbThis))
    end
  end

  def pbAdditionalEffect(user, target)
    super if Settings::MECHANICS_GENERATION >= 9
  end
end

#===============================================================================
# Recollection
#===============================================================================
class Battle::Move::CopyTarget < Battle::Move
  def pbMoveFailed?(user, targets)
    if user.effects[PBEffects::Transform] || user.effects[PBEffects::Recollection]
      @battle.pbDisplay(_INTL("But it failed!"))
      return true
    end
    return false
  end

  def pbFailsAgainstTarget?(user, target, show_message)
    if target.effects[PBEffects::Transform] ||
       target.effects[PBEffects::Recollection] ||
       target.effects[PBEffects::Illusion]
      @battle.pbDisplay(_INTL("But it failed!")) if show_message
      return true
    end
    return false
  end

  def pbEffectAgainstTarget(user, target)
    user.pbRecollection(target)
  end

  def pbShowAnimation(id, user, targets, hitNum = 0, showAnimation = true)
    super
  end
end

#===============================================================================
# Hits target when using Shadow Dive.
#===============================================================================
class Battle::Move::HitsTargetInShadow < Battle::Move
  def hitsShadowTargets?; return true; end
    
  def pbBaseDamage(baseDmg, user, target)
    case @id
    when :SHADOWPUNCH
      baseDmg *= 2 if target.inTwoTurnAttack?("TwoTurnAttackInvulnerableRemoveProtections")
    when :SHADOWSNEAK
      baseDmg *= 2 if target.inTwoTurnAttack?("TwoTurnAttackInvulnerableRemoveProtections")
    end
    return baseDmg
  end
end
