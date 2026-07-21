EventHandlers.add(:on_trainer_load, :trainer_tower_set,
   proc { |trainer|
    next if !$game_map.metadata&.has_flag?("TrainerTower")

    puppet1 = rand(6)
    puppet2 = rand(6)
    puppet3 = rand(6)
    puppet4 = rand(6)
    loop do
      puppet2 = rand(6) if puppet2 == puppet1
      break if puppet2 != puppet1
    end
    loop do
      puppet3 = rand(6) if puppet3 == puppet1 || puppet3 == puppet2
      break if puppet3 != puppet1 && puppet3 != puppet2
    end
    loop do
      puppet4 = rand(6) if puppet4 == puppet1 || puppet4 == puppet2 || puppet4 == puppet3
      break if puppet4 != puppet1 && puppet4 != puppet2 && puppet4 != puppet3
    end

    new_level = pbBalancedLevel($player.party)
    new_level = new_level.clamp(1, GameData::GrowthRate.max_level)

    # ==================================================
    # Single Battle Trainers
    # ==================================================
    # Youngster Cole
    if trainer && trainer.trainer_type_name == ("Youngster") && trainer.name == ("Cole")
      
      trainer.party[0].level = new_level
      trainer.party[1].level = new_level
      trainer.party[2].level = new_level

      if puppet1 == 0
        trainer.party[0].species = :NAZRIN
        trainer.party[0].name = "Nazrin"
        trainer.party[0].learn_move(:TRIATTACK)
        trainer.party[0].learn_move(:DIG)
        trainer.party[0].learn_move(:KILLINGBITE)
        trainer.party[0].learn_move(:THIEF)
        trainer.party[0].ev[:HP]              = 0
        trainer.party[0].ev[:ATTACK]          = 129
        trainer.party[0].ev[:DEFENSE]         = 0
        trainer.party[0].ev[:SPECIAL_ATTACK]  = 129
        trainer.party[0].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[0].ev[:SPEED]           = 252
        trainer.party[0].iv[:HP]              = 20
        trainer.party[0].iv[:ATTACK]          = 20
        trainer.party[0].iv[:DEFENSE]         = 20
        trainer.party[0].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[0].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[0].iv[:SPEED]           = 20
        trainer.party[0].ability_index = 0
        trainer.party[0].shiny = false
        trainer.party[0].item = :SITRUSBERRY
        trainer.party[0].nature = :NAIVE
        trainer.party[0].calc_stats
      elsif puppet1 == 1
        trainer.party[0].species = :YUKI
        trainer.party[0].name = "Yuki"
        trainer.party[0].learn_move(:SACREDFIRE)
        trainer.party[0].learn_move(:FIREBLAST)
        trainer.party[0].learn_move(:SUNNYDAY)
        trainer.party[0].learn_move(:SOLARBEAM)
        trainer.party[0].ev[:HP]              = 6
        trainer.party[0].ev[:ATTACK]          = 0
        trainer.party[0].ev[:DEFENSE]         = 0
        trainer.party[0].ev[:SPECIAL_ATTACK]  = 252
        trainer.party[0].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[0].ev[:SPEED]           = 252
        trainer.party[0].iv[:HP]              = 20
        trainer.party[0].iv[:ATTACK]          = 20
        trainer.party[0].iv[:DEFENSE]         = 20
        trainer.party[0].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[0].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[0].iv[:SPEED]           = 20
        trainer.party[0].ability_index = 1
        trainer.party[0].shiny = false
        trainer.party[0].item = :SITRUSBERRY
        trainer.party[0].nature = :TIMID
        trainer.party[0].calc_stats
      elsif puppet1 == 2
        trainer.party[0].species = :ICHIRIN
        trainer.party[0].name = "Ichirin"
        trainer.party[0].learn_move(:BELLYDRUM)
        trainer.party[0].learn_move(:COMETPUNCH)
        trainer.party[0].learn_move(:ICEPUNCH)
        trainer.party[0].learn_move(:METALPUNCH)
        trainer.party[0].ev[:HP]              = 0
        trainer.party[0].ev[:ATTACK]          = 252
        trainer.party[0].ev[:DEFENSE]         = 252
        trainer.party[0].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[0].ev[:SPECIAL_DEFENSE] = 6
        trainer.party[0].ev[:SPEED]           = 0
        trainer.party[0].iv[:HP]              = 20
        trainer.party[0].iv[:ATTACK]          = 20
        trainer.party[0].iv[:DEFENSE]         = 20
        trainer.party[0].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[0].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[0].iv[:SPEED]           = 20
        trainer.party[0].ability_index = 0
        trainer.party[0].shiny = false
        trainer.party[0].item = :SITRUSBERRY
        trainer.party[0].nature = :JOLLY
        trainer.party[0].calc_stats
      elsif puppet1 == 3
        trainer.party[0].species = :SRUMIA
        trainer.party[0].name = "SRumia"
        trainer.party[0].learn_move(:POISONBOMB)
        trainer.party[0].learn_move(:DARKPULSE)
        trainer.party[0].learn_move(:SHADOWBALL)
        trainer.party[0].learn_move(:GIGADRAIN)
        trainer.party[0].ev[:HP]              = 252
        trainer.party[0].ev[:ATTACK]          = 0
        trainer.party[0].ev[:DEFENSE]         = 0
        trainer.party[0].ev[:SPECIAL_ATTACK]  = 6
        trainer.party[0].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[0].ev[:SPEED]           = 252
        trainer.party[0].iv[:HP]              = 20
        trainer.party[0].iv[:ATTACK]          = 20
        trainer.party[0].iv[:DEFENSE]         = 20
        trainer.party[0].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[0].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[0].iv[:SPEED]           = 20
        trainer.party[0].ability_index = 0
        trainer.party[0].shiny = false
        trainer.party[0].item = :SITRUSBERRY
        trainer.party[0].nature = :RASH
        trainer.party[0].calc_stats
      elsif puppet1 == 4
        trainer.party[0].species = :NITORI
        trainer.party[0].name = "Nitori"
        trainer.party[0].learn_move(:RAINDANCE)
        trainer.party[0].learn_move(:THUNDER)
        trainer.party[0].learn_move(:HYDROPUMP)
        trainer.party[0].learn_move(:MYSTICWATER)
        trainer.party[0].ev[:HP]              = 6
        trainer.party[0].ev[:ATTACK]          = 0
        trainer.party[0].ev[:DEFENSE]         = 0
        trainer.party[0].ev[:SPECIAL_ATTACK]  = 252
        trainer.party[0].ev[:SPECIAL_DEFENSE] = 252
        trainer.party[0].ev[:SPEED]           = 0
        trainer.party[0].iv[:HP]              = 20
        trainer.party[0].iv[:ATTACK]          = 20
        trainer.party[0].iv[:DEFENSE]         = 20
        trainer.party[0].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[0].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[0].iv[:SPEED]           = 20
        trainer.party[0].ability_index = 1
        trainer.party[0].shiny = false
        trainer.party[0].item = :SITRUSBERRY
        trainer.party[0].nature = :QUIET
        trainer.party[0].calc_stats
      elsif puppet1 == 5
        trainer.party[0].species = :SUTSUHO
        trainer.party[0].name = "SUtsuho"
        trainer.party[0].learn_move(:SUNNYDAY)
        trainer.party[0].learn_move(:STEELWING)
        trainer.party[0].learn_move(:BLAZEKICK)
        trainer.party[0].learn_move(:SOAR)
        trainer.party[0].ev[:HP]              = 6
        trainer.party[0].ev[:ATTACK]          = 252
        trainer.party[0].ev[:DEFENSE]         = 0
        trainer.party[0].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[0].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[0].ev[:SPEED]           = 252
        trainer.party[0].iv[:HP]              = 20
        trainer.party[0].iv[:ATTACK]          = 20
        trainer.party[0].iv[:DEFENSE]         = 20
        trainer.party[0].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[0].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[0].iv[:SPEED]           = 20
        trainer.party[0].ability_index = 0
        trainer.party[0].shiny = false
        trainer.party[0].item = :SITRUSBERRY
        trainer.party[0].nature = :ADAMANT
        trainer.party[0].calc_stats
      end

      if puppet2 == 0
        trainer.party[1].species = :NAZRIN
        trainer.party[1].name = "Nazrin"
        trainer.party[1].learn_move(:TRIATTACK)
        trainer.party[1].learn_move(:DIG)
        trainer.party[1].learn_move(:KILLINGBITE)
        trainer.party[1].learn_move(:THIEF)
        trainer.party[1].ev[:HP]              = 0
        trainer.party[1].ev[:ATTACK]          = 129
        trainer.party[1].ev[:DEFENSE]         = 0
        trainer.party[1].ev[:SPECIAL_ATTACK]  = 129
        trainer.party[1].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[1].ev[:SPEED]           = 252
        trainer.party[1].iv[:HP]              = 20
        trainer.party[1].iv[:ATTACK]          = 20
        trainer.party[1].iv[:DEFENSE]         = 20
        trainer.party[1].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[1].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[1].iv[:SPEED]           = 20
        trainer.party[1].ability_index = 0
        trainer.party[1].shiny = false
        trainer.party[1].item = :SITRUSBERRY
        trainer.party[1].nature = :NAIVE
        trainer.party[1].calc_stats
      elsif puppet2 == 1
        trainer.party[1].species = :YUKI
        trainer.party[1].name = "Yuki"
        trainer.party[1].learn_move(:SACREDFIRE)
        trainer.party[1].learn_move(:FIREBLAST)
        trainer.party[1].learn_move(:SUNNYDAY)
        trainer.party[1].learn_move(:SOLARBEAM)
        trainer.party[1].ev[:HP]              = 6
        trainer.party[1].ev[:ATTACK]          = 0
        trainer.party[1].ev[:DEFENSE]         = 0
        trainer.party[1].ev[:SPECIAL_ATTACK]  = 252
        trainer.party[1].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[1].ev[:SPEED]           = 252
        trainer.party[1].iv[:HP]              = 20
        trainer.party[1].iv[:ATTACK]          = 20
        trainer.party[1].iv[:DEFENSE]         = 20
        trainer.party[1].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[1].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[1].iv[:SPEED]           = 20
        trainer.party[1].ability_index = 1
        trainer.party[1].shiny = false
        trainer.party[1].item = :SITRUSBERRY
        trainer.party[1].nature = :TIMID
        trainer.party[1].calc_stats
      elsif puppet2 == 2
        trainer.party[1].species = :ICHIRIN
        trainer.party[1].name = "Ichirin"
        trainer.party[1].learn_move(:BELLYDRUM)
        trainer.party[1].learn_move(:COMETPUNCH)
        trainer.party[1].learn_move(:ICEPUNCH)
        trainer.party[1].learn_move(:METALPUNCH)
        trainer.party[1].ev[:HP]              = 0
        trainer.party[1].ev[:ATTACK]          = 252
        trainer.party[1].ev[:DEFENSE]         = 252
        trainer.party[1].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[1].ev[:SPECIAL_DEFENSE] = 6
        trainer.party[1].ev[:SPEED]           = 0
        trainer.party[1].iv[:HP]              = 20
        trainer.party[1].iv[:ATTACK]          = 20
        trainer.party[1].iv[:DEFENSE]         = 20
        trainer.party[1].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[1].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[1].iv[:SPEED]           = 20
        trainer.party[1].ability_index = 0
        trainer.party[1].shiny = false
        trainer.party[1].item = :SITRUSBERRY
        trainer.party[1].nature = :JOLLY
        trainer.party[1].calc_stats
      elsif puppet2 == 3
        trainer.party[1].species = :SRUMIA
        trainer.party[1].name = "SRumia"
        trainer.party[1].learn_move(:POISONBOMB)
        trainer.party[1].learn_move(:DARKPULSE)
        trainer.party[1].learn_move(:SHADOWBALL)
        trainer.party[1].learn_move(:GIGADRAIN)
        trainer.party[1].ev[:HP]              = 252
        trainer.party[1].ev[:ATTACK]          = 0
        trainer.party[1].ev[:DEFENSE]         = 0
        trainer.party[1].ev[:SPECIAL_ATTACK]  = 6
        trainer.party[1].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[1].ev[:SPEED]           = 252
        trainer.party[1].iv[:HP]              = 20
        trainer.party[1].iv[:ATTACK]          = 20
        trainer.party[1].iv[:DEFENSE]         = 20
        trainer.party[1].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[1].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[1].iv[:SPEED]           = 20
        trainer.party[1].ability_index = 0
        trainer.party[1].shiny = false
        trainer.party[1].item = :SITRUSBERRY
        trainer.party[1].nature = :RASH
        trainer.party[1].calc_stats
      elsif puppet2 == 4
        trainer.party[1].species = :NITORI
        trainer.party[1].name = "Nitori"
        trainer.party[1].learn_move(:RAINDANCE)
        trainer.party[1].learn_move(:THUNDER)
        trainer.party[1].learn_move(:HYDROPUMP)
        trainer.party[1].learn_move(:MYSTICWATER)
        trainer.party[1].ev[:HP]              = 6
        trainer.party[1].ev[:ATTACK]          = 0
        trainer.party[1].ev[:DEFENSE]         = 0
        trainer.party[1].ev[:SPECIAL_ATTACK]  = 252
        trainer.party[1].ev[:SPECIAL_DEFENSE] = 252
        trainer.party[1].ev[:SPEED]           = 0
        trainer.party[1].iv[:HP]              = 20
        trainer.party[1].iv[:ATTACK]          = 20
        trainer.party[1].iv[:DEFENSE]         = 20
        trainer.party[1].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[1].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[1].iv[:SPEED]           = 20
        trainer.party[1].ability_index = 1
        trainer.party[1].shiny = false
        trainer.party[1].item = :SITRUSBERRY
        trainer.party[1].nature = :QUIET
        trainer.party[1].calc_stats
      elsif puppet2 == 5
        trainer.party[1].species = :SUTSUHO
        trainer.party[1].name = "SUtsuho"
        trainer.party[1].learn_move(:SUNNYDAY)
        trainer.party[1].learn_move(:STEELWING)
        trainer.party[1].learn_move(:BLAZEKICK)
        trainer.party[1].learn_move(:SOAR)
        trainer.party[1].ev[:HP]              = 6
        trainer.party[1].ev[:ATTACK]          = 252
        trainer.party[1].ev[:DEFENSE]         = 0
        trainer.party[1].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[1].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[1].ev[:SPEED]           = 252
        trainer.party[1].iv[:HP]              = 20
        trainer.party[1].iv[:ATTACK]          = 20
        trainer.party[1].iv[:DEFENSE]         = 20
        trainer.party[1].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[1].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[1].iv[:SPEED]           = 20
        trainer.party[1].ability_index = 0
        trainer.party[1].shiny = false
        trainer.party[1].item = :SITRUSBERRY
        trainer.party[1].nature = :ADAMANT
        trainer.party[1].calc_stats
      end

      if puppet3 == 0
        trainer.party[2].species = :NAZRIN
        trainer.party[2].name = "Nazrin"
        trainer.party[2].learn_move(:TRIATTACK)
        trainer.party[2].learn_move(:DIG)
        trainer.party[2].learn_move(:KILLINGBITE)
        trainer.party[2].learn_move(:THIEF)
        trainer.party[2].ev[:HP]              = 0
        trainer.party[2].ev[:ATTACK]          = 129
        trainer.party[2].ev[:DEFENSE]         = 0
        trainer.party[2].ev[:SPECIAL_ATTACK]  = 129
        trainer.party[2].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[2].ev[:SPEED]           = 252
        trainer.party[2].iv[:HP]              = 20
        trainer.party[2].iv[:ATTACK]          = 20
        trainer.party[2].iv[:DEFENSE]         = 20
        trainer.party[2].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[2].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[2].iv[:SPEED]           = 20
        trainer.party[2].ability_index = 0
        trainer.party[2].shiny = false
        trainer.party[2].item = :SITRUSBERRY
        trainer.party[2].nature = :NAIVE
        trainer.party[2].calc_stats
      elsif puppet3 == 1
        trainer.party[2].species = :YUKI
        trainer.party[2].name = "Yuki"
        trainer.party[2].learn_move(:SACREDFIRE)
        trainer.party[2].learn_move(:FIREBLAST)
        trainer.party[2].learn_move(:SUNNYDAY)
        trainer.party[2].learn_move(:SOLARBEAM)
        trainer.party[2].ev[:HP]              = 6
        trainer.party[2].ev[:ATTACK]          = 0
        trainer.party[2].ev[:DEFENSE]         = 0
        trainer.party[2].ev[:SPECIAL_ATTACK]  = 252
        trainer.party[2].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[2].ev[:SPEED]           = 252
        trainer.party[2].iv[:HP]              = 20
        trainer.party[2].iv[:ATTACK]          = 20
        trainer.party[2].iv[:DEFENSE]         = 20
        trainer.party[2].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[2].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[2].iv[:SPEED]           = 20
        trainer.party[2].ability_index = 1
        trainer.party[2].shiny = false
        trainer.party[2].item = :SITRUSBERRY
        trainer.party[2].nature = :TIMID
        trainer.party[2].calc_stats
      elsif puppet3 == 2
        trainer.party[2].species = :ICHIRIN
        trainer.party[2].name = "Ichirin"
        trainer.party[2].learn_move(:BELLYDRUM)
        trainer.party[2].learn_move(:COMETPUNCH)
        trainer.party[2].learn_move(:ICEPUNCH)
        trainer.party[2].learn_move(:METALPUNCH)
        trainer.party[2].ev[:HP]              = 0
        trainer.party[2].ev[:ATTACK]          = 252
        trainer.party[2].ev[:DEFENSE]         = 252
        trainer.party[2].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[2].ev[:SPECIAL_DEFENSE] = 6
        trainer.party[2].ev[:SPEED]           = 0
        trainer.party[2].iv[:HP]              = 20
        trainer.party[2].iv[:ATTACK]          = 20
        trainer.party[2].iv[:DEFENSE]         = 20
        trainer.party[2].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[2].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[2].iv[:SPEED]           = 20
        trainer.party[2].ability_index = 0
        trainer.party[2].shiny = false
        trainer.party[2].item = :SITRUSBERRY
        trainer.party[2].nature = :JOLLY
        trainer.party[2].calc_stats
      elsif puppet3 == 3
        trainer.party[2].species = :SRUMIA
        trainer.party[2].name = "SRumia"
        trainer.party[2].learn_move(:POISONBOMB)
        trainer.party[2].learn_move(:DARKPULSE)
        trainer.party[2].learn_move(:SHADOWBALL)
        trainer.party[2].learn_move(:GIGADRAIN)
        trainer.party[2].ev[:HP]              = 252
        trainer.party[2].ev[:ATTACK]          = 0
        trainer.party[2].ev[:DEFENSE]         = 0
        trainer.party[2].ev[:SPECIAL_ATTACK]  = 6
        trainer.party[2].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[2].ev[:SPEED]           = 252
        trainer.party[2].iv[:HP]              = 20
        trainer.party[2].iv[:ATTACK]          = 20
        trainer.party[2].iv[:DEFENSE]         = 20
        trainer.party[2].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[2].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[2].iv[:SPEED]           = 20
        trainer.party[2].ability_index = 0
        trainer.party[2].shiny = false
        trainer.party[2].item = :SITRUSBERRY
        trainer.party[2].nature = :RASH
        trainer.party[2].calc_stats
      elsif puppet3 == 4
        trainer.party[2].species = :NITORI
        trainer.party[2].name = "Nitori"
        trainer.party[2].learn_move(:RAINDANCE)
        trainer.party[2].learn_move(:THUNDER)
        trainer.party[2].learn_move(:HYDROPUMP)
        trainer.party[2].learn_move(:MYSTICWATER)
        trainer.party[2].ev[:HP]              = 6
        trainer.party[2].ev[:ATTACK]          = 0
        trainer.party[2].ev[:DEFENSE]         = 0
        trainer.party[2].ev[:SPECIAL_ATTACK]  = 252
        trainer.party[2].ev[:SPECIAL_DEFENSE] = 252
        trainer.party[2].ev[:SPEED]           = 0
        trainer.party[2].iv[:HP]              = 20
        trainer.party[2].iv[:ATTACK]          = 20
        trainer.party[2].iv[:DEFENSE]         = 20
        trainer.party[2].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[2].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[2].iv[:SPEED]           = 20
        trainer.party[2].ability_index = 1
        trainer.party[2].shiny = false
        trainer.party[2].item = :SITRUSBERRY
        trainer.party[2].nature = :QUIET
        trainer.party[2].calc_stats
      elsif puppet3 == 5
        trainer.party[2].species = :SUTSUHO
        trainer.party[2].name = "SUtsuho"
        trainer.party[2].learn_move(:SUNNYDAY)
        trainer.party[2].learn_move(:STEELWING)
        trainer.party[2].learn_move(:BLAZEKICK)
        trainer.party[2].learn_move(:SOAR)
        trainer.party[2].ev[:HP]              = 6
        trainer.party[2].ev[:ATTACK]          = 252
        trainer.party[2].ev[:DEFENSE]         = 0
        trainer.party[2].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[2].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[2].ev[:SPEED]           = 252
        trainer.party[2].iv[:HP]              = 20
        trainer.party[2].iv[:ATTACK]          = 20
        trainer.party[2].iv[:DEFENSE]         = 20
        trainer.party[2].iv[:SPECIAL_ATTACK]  = 20
        trainer.party[2].iv[:SPECIAL_DEFENSE] = 20
        trainer.party[2].iv[:SPEED]           = 20
        trainer.party[2].ability_index = 0
        trainer.party[2].shiny = false
        trainer.party[2].item = :SITRUSBERRY
        trainer.party[2].nature = :ADAMANT
        trainer.party[2].calc_stats
      end
    end


    # Sailor Alberto
    if trainer && trainer.trainer_type_name == ("Sailor") && trainer.name == ("Alberto")
      
      trainer.party[0].level = new_level
      trainer.party[1].level = new_level
      trainer.party[2].level = new_level

      if puppet1 == 0
        trainer.party[0].species = :TREISEN
        trainer.party[0].name = "TReisen"
        trainer.party[0].learn_move(:JAMMING)
        trainer.party[0].learn_move(:SIGNALBEAM)
        trainer.party[0].learn_move(:SHADOWHIT)
        trainer.party[0].learn_move(:ICEBEAM)
        trainer.party[0].ev[:HP]              = 6
        trainer.party[0].ev[:ATTACK]          = 0
        trainer.party[0].ev[:DEFENSE]         = 0
        trainer.party[0].ev[:SPECIAL_ATTACK]  = 252
        trainer.party[0].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[0].ev[:SPEED]           = 252
        trainer.party[0].iv[:HP]              = 15
        trainer.party[0].iv[:ATTACK]          = 15
        trainer.party[0].iv[:DEFENSE]         = 15
        trainer.party[0].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[0].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[0].iv[:SPEED]           = 15
        trainer.party[0].ability_index = 1
        trainer.party[0].shiny = false
        trainer.party[0].item = :FOCUSBAND
        trainer.party[0].nature = :TIMID
        trainer.party[0].calc_stats
      elsif puppet1 == 1
        trainer.party[0].species = :MURASA
        trainer.party[0].name = "Murasa"
        trainer.party[0].learn_move(:SUBSTITUTE)
        trainer.party[0].learn_move(:SHADOWPUNCH)
        trainer.party[0].learn_move(:ICEPUNCH)
        trainer.party[0].learn_move(:AQUAJET)
        trainer.party[0].ev[:HP]              = 252
        trainer.party[0].ev[:ATTACK]          = 252
        trainer.party[0].ev[:DEFENSE]         = 0
        trainer.party[0].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[0].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[0].ev[:SPEED]           = 6
        trainer.party[0].iv[:HP]              = 15
        trainer.party[0].iv[:ATTACK]          = 15
        trainer.party[0].iv[:DEFENSE]         = 15
        trainer.party[0].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[0].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[0].iv[:SPEED]           = 15
        trainer.party[0].ability_index = 0
        trainer.party[0].shiny = false
        trainer.party[0].item = :SCOPELENS
        trainer.party[0].nature = :HARDY
        trainer.party[0].calc_stats
      elsif puppet1 == 2
        trainer.party[0].species = :KEINE
        trainer.party[0].name = "Keine"
        trainer.party[0].learn_move(:SKULLBASH)
        trainer.party[0].learn_move(:HEADBUTT)
        trainer.party[0].learn_move(:THUNDERBOLT)
        trainer.party[0].learn_move(:FLASH)
        trainer.party[0].ev[:HP]              = 0
        trainer.party[0].ev[:ATTACK]          = 252
        trainer.party[0].ev[:DEFENSE]         = 126
        trainer.party[0].ev[:SPECIAL_ATTACK]  = 132
        trainer.party[0].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[0].ev[:SPEED]           = 0
        trainer.party[0].iv[:HP]              = 15
        trainer.party[0].iv[:ATTACK]          = 15
        trainer.party[0].iv[:DEFENSE]         = 15
        trainer.party[0].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[0].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[0].iv[:SPEED]           = 15
        trainer.party[0].ability_index = 0
        trainer.party[0].shiny = false
        trainer.party[0].item = :QUICKCLAW
        trainer.party[0].nature = :NAUGHTY
        trainer.party[0].calc_stats
      elsif puppet1 == 3
        trainer.party[0].species = :HEIRIN
        trainer.party[0].name = "HEirin"
        trainer.party[0].learn_move(:AQUASHOWER)
        trainer.party[0].learn_move(:HYPNOSIS)
        trainer.party[0].learn_move(:POISONBOMB)
        trainer.party[0].learn_move(:NIGHTSHADE)
        trainer.party[0].ev[:HP]              = 252
        trainer.party[0].ev[:ATTACK]          = 0
        trainer.party[0].ev[:DEFENSE]         = 6
        trainer.party[0].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[0].ev[:SPECIAL_DEFENSE] = 252
        trainer.party[0].ev[:SPEED]           = 0
        trainer.party[0].iv[:HP]              = 15
        trainer.party[0].iv[:ATTACK]          = 15
        trainer.party[0].iv[:DEFENSE]         = 15
        trainer.party[0].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[0].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[0].iv[:SPEED]           = 15
        trainer.party[0].ability_index = 0
        trainer.party[0].shiny = false
        trainer.party[0].item = :LEFTOVERS
        trainer.party[0].nature = :CALM
        trainer.party[0].calc_stats
      elsif puppet1 == 4
        trainer.party[0].species = :SKOMACHI
        trainer.party[0].name = "SKomachi"
        trainer.party[0].learn_move(:BATONPASS)
        trainer.party[0].learn_move(:AMNESIA)
        trainer.party[0].learn_move(:CUT)
        trainer.party[0].learn_move(:SPLASHING)
        trainer.party[0].ev[:HP]              = 6
        trainer.party[0].ev[:ATTACK]          = 252
        trainer.party[0].ev[:DEFENSE]         = 0
        trainer.party[0].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[0].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[0].ev[:SPEED]           = 252
        trainer.party[0].iv[:HP]              = 15
        trainer.party[0].iv[:ATTACK]          = 15
        trainer.party[0].iv[:DEFENSE]         = 15
        trainer.party[0].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[0].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[0].iv[:SPEED]           = 15
        trainer.party[0].ability_index = 1
        trainer.party[0].shiny = false
        trainer.party[0].item = :SALACBERRY
        trainer.party[0].nature = :HASTY
        trainer.party[0].calc_stats
      elsif puppet1 == 5
        trainer.party[0].species = :KYOUKO
        trainer.party[0].name = "Kyouko"
        trainer.party[0].learn_move(:PERFORMANCE)
        trainer.party[0].learn_move(:HYPERVOICE)
        trainer.party[0].learn_move(:BINDINGVOICE)
        trainer.party[0].learn_move(:SONICBOOM)
        trainer.party[0].ev[:HP]              = 0
        trainer.party[0].ev[:ATTACK]          = 0
        trainer.party[0].ev[:DEFENSE]         = 0
        trainer.party[0].ev[:SPECIAL_ATTACK]  = 252
        trainer.party[0].ev[:SPECIAL_DEFENSE] = 252
        trainer.party[0].ev[:SPEED]           = 6
        trainer.party[0].iv[:HP]              = 15
        trainer.party[0].iv[:ATTACK]          = 15
        trainer.party[0].iv[:DEFENSE]         = 15
        trainer.party[0].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[0].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[0].iv[:SPEED]           = 15
        trainer.party[0].ability_index = 0
        trainer.party[0].shiny = false
        trainer.party[0].item = :PETAYABERRY
        trainer.party[0].nature = :QUIET
        trainer.party[0].calc_stats
      end

      if puppet2 == 0
        trainer.party[1].species = :TREISEN
        trainer.party[1].name = "TReisen"
        trainer.party[1].learn_move(:JAMMING)
        trainer.party[1].learn_move(:SIGNALBEAM)
        trainer.party[1].learn_move(:SHADOWHIT)
        trainer.party[1].learn_move(:ICEBEAM)
        trainer.party[1].ev[:HP]              = 6
        trainer.party[1].ev[:ATTACK]          = 0
        trainer.party[1].ev[:DEFENSE]         = 0
        trainer.party[1].ev[:SPECIAL_ATTACK]  = 252
        trainer.party[1].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[1].ev[:SPEED]           = 252
        trainer.party[1].iv[:HP]              = 15
        trainer.party[1].iv[:ATTACK]          = 15
        trainer.party[1].iv[:DEFENSE]         = 15
        trainer.party[1].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[1].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[1].iv[:SPEED]           = 15
        trainer.party[1].ability_index = 1
        trainer.party[1].shiny = false
        trainer.party[1].item = :FOCUSBAND
        trainer.party[1].nature = :TIMID
        trainer.party[1].shiny = false
        trainer.party[1].calc_stats
      elsif puppet2 == 1
        trainer.party[1].species = :MURASA
        trainer.party[1].name = "Murasa"
        trainer.party[1].learn_move(:SUBSTITUTE)
        trainer.party[1].learn_move(:SHADOWPUNCH)
        trainer.party[1].learn_move(:ICEPUNCH)
        trainer.party[1].learn_move(:AQUAJET)
        trainer.party[1].ev[:HP]              = 252
        trainer.party[1].ev[:ATTACK]          = 252
        trainer.party[1].ev[:DEFENSE]         = 0
        trainer.party[1].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[1].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[1].ev[:SPEED]           = 6
        trainer.party[1].iv[:HP]              = 15
        trainer.party[1].iv[:ATTACK]          = 15
        trainer.party[1].iv[:DEFENSE]         = 15
        trainer.party[1].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[1].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[1].iv[:SPEED]           = 15
        trainer.party[1].ability_index = 0
        trainer.party[1].shiny = false
        trainer.party[1].item = :SCOPELENS
        trainer.party[1].nature = :HARDY
        trainer.party[1].calc_stats
      elsif puppet2 == 2
        trainer.party[1].species = :KEINE
        trainer.party[1].name = "Keine"
        trainer.party[1].learn_move(:SKULLBASH)
        trainer.party[1].learn_move(:HEADBUTT)
        trainer.party[1].learn_move(:THUNDERBOLT)
        trainer.party[1].learn_move(:FLASH)
        trainer.party[1].ev[:HP]              = 0
        trainer.party[1].ev[:ATTACK]          = 252
        trainer.party[1].ev[:DEFENSE]         = 126
        trainer.party[1].ev[:SPECIAL_ATTACK]  = 132
        trainer.party[1].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[1].ev[:SPEED]           = 0
        trainer.party[1].iv[:HP]              = 15
        trainer.party[1].iv[:ATTACK]          = 15
        trainer.party[1].iv[:DEFENSE]         = 15
        trainer.party[1].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[1].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[1].iv[:SPEED]           = 15
        trainer.party[1].ability_index = 0
        trainer.party[1].shiny = false
        trainer.party[1].item = :QUICKCLAW
        trainer.party[1].nature = :NAUGHTY
        trainer.party[1].calc_stats
      elsif puppet2 == 3
        trainer.party[1].species = :HEIRIN
        trainer.party[1].name = "HEirin"
        trainer.party[1].learn_move(:AQUASHOWER)
        trainer.party[1].learn_move(:HYPNOSIS)
        trainer.party[1].learn_move(:POISONBOMB)
        trainer.party[1].learn_move(:NIGHTSHADE)
        trainer.party[1].ev[:HP]              = 252
        trainer.party[1].ev[:ATTACK]          = 0
        trainer.party[1].ev[:DEFENSE]         = 6
        trainer.party[1].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[1].ev[:SPECIAL_DEFENSE] = 252
        trainer.party[1].ev[:SPEED]           = 0
        trainer.party[1].iv[:HP]              = 15
        trainer.party[1].iv[:ATTACK]          = 15
        trainer.party[1].iv[:DEFENSE]         = 15
        trainer.party[1].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[1].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[1].iv[:SPEED]           = 15
        trainer.party[1].ability_index = 0
        trainer.party[1].shiny = false
        trainer.party[1].item = :LEFTOVERS
        trainer.party[1].nature = :CALM
        trainer.party[1].calc_stats
      elsif puppet2 == 4
        trainer.party[1].species = :SKOMACHI
        trainer.party[1].name = "SKomachi"
        trainer.party[1].learn_move(:BATONPASS)
        trainer.party[1].learn_move(:AMNESIA)
        trainer.party[1].learn_move(:CUT)
        trainer.party[1].learn_move(:SPLASHING)
        trainer.party[1].ev[:HP]              = 6
        trainer.party[1].ev[:ATTACK]          = 252
        trainer.party[1].ev[:DEFENSE]         = 0
        trainer.party[1].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[1].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[1].ev[:SPEED]           = 252
        trainer.party[1].iv[:HP]              = 15
        trainer.party[1].iv[:ATTACK]          = 15
        trainer.party[1].iv[:DEFENSE]         = 15
        trainer.party[1].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[1].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[1].iv[:SPEED]           = 15
        trainer.party[1].ability_index = 1
        trainer.party[1].shiny = false
        trainer.party[1].item = :SALACBERRY
        trainer.party[1].nature = :HASTY
        trainer.party[1].calc_stats
      elsif puppet2 == 5
        trainer.party[1].species = :KYOUKO
        trainer.party[1].name = "Kyouko"
        trainer.party[1].learn_move(:PERFORMANCE)
        trainer.party[1].learn_move(:HYPERVOICE)
        trainer.party[1].learn_move(:BINDINGVOICE)
        trainer.party[1].learn_move(:SONICBOOM)
        trainer.party[1].ev[:HP]              = 0
        trainer.party[1].ev[:ATTACK]          = 0
        trainer.party[1].ev[:DEFENSE]         = 0
        trainer.party[1].ev[:SPECIAL_ATTACK]  = 252
        trainer.party[1].ev[:SPECIAL_DEFENSE] = 252
        trainer.party[1].ev[:SPEED]           = 6
        trainer.party[1].iv[:HP]              = 15
        trainer.party[1].iv[:ATTACK]          = 15
        trainer.party[1].iv[:DEFENSE]         = 15
        trainer.party[1].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[1].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[1].iv[:SPEED]           = 15
        trainer.party[1].ability_index = 0
        trainer.party[1].shiny = false
        trainer.party[1].item = :PETAYABERRY
        trainer.party[1].nature = :QUIET
        trainer.party[1].calc_stats
      end

      if puppet3 == 0
        trainer.party[2].species = :TREISEN
        trainer.party[2].name = "TReisen"
        trainer.party[2].learn_move(:JAMMING)
        trainer.party[2].learn_move(:SIGNALBEAM)
        trainer.party[2].learn_move(:SHADOWHIT)
        trainer.party[2].learn_move(:ICEBEAM)
        trainer.party[2].ev[:HP]              = 6
        trainer.party[2].ev[:ATTACK]          = 0
        trainer.party[2].ev[:DEFENSE]         = 0
        trainer.party[2].ev[:SPECIAL_ATTACK]  = 252
        trainer.party[2].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[2].ev[:SPEED]           = 252
        trainer.party[2].iv[:HP]              = 15
        trainer.party[2].iv[:ATTACK]          = 15
        trainer.party[2].iv[:DEFENSE]         = 15
        trainer.party[2].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[2].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[2].iv[:SPEED]           = 15
        trainer.party[2].ability_index = 1
        trainer.party[2].shiny = false
        trainer.party[2].item = :FOCUSBAND
        trainer.party[2].nature = :TIMID
        trainer.party[2].calc_stats
      elsif puppet3 == 1
        trainer.party[2].species = :MURASA
        trainer.party[2].name = "Murasa"
        trainer.party[2].learn_move(:SUBSTITUTE)
        trainer.party[2].learn_move(:SHADOWPUNCH)
        trainer.party[2].learn_move(:ICEPUNCH)
        trainer.party[2].learn_move(:AQUAJET)
        trainer.party[2].ev[:HP]              = 252
        trainer.party[2].ev[:ATTACK]          = 252
        trainer.party[2].ev[:DEFENSE]         = 0
        trainer.party[2].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[2].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[2].ev[:SPEED]           = 6
        trainer.party[2].iv[:HP]              = 15
        trainer.party[2].iv[:ATTACK]          = 15
        trainer.party[2].iv[:DEFENSE]         = 15
        trainer.party[2].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[2].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[2].iv[:SPEED]           = 15
        trainer.party[2].ability_index = 0
        trainer.party[2].shiny = false
        trainer.party[2].item = :SCOPELENS
        trainer.party[2].nature = :HARDY
        trainer.party[2].calc_stats
      elsif puppet3 == 2
        trainer.party[2].species = :KEINE
        trainer.party[2].name = "Keine"
        trainer.party[2].learn_move(:SKULLBASH)
        trainer.party[2].learn_move(:HEADBUTT)
        trainer.party[2].learn_move(:THUNDERBOLT)
        trainer.party[2].learn_move(:FLASH)
        trainer.party[2].ev[:HP]              = 0
        trainer.party[2].ev[:ATTACK]          = 252
        trainer.party[2].ev[:DEFENSE]         = 126
        trainer.party[2].ev[:SPECIAL_ATTACK]  = 132
        trainer.party[2].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[2].ev[:SPEED]           = 0
        trainer.party[2].iv[:HP]              = 15
        trainer.party[2].iv[:ATTACK]          = 15
        trainer.party[2].iv[:DEFENSE]         = 15
        trainer.party[2].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[2].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[2].iv[:SPEED]           = 15
        trainer.party[2].ability_index = 0
        trainer.party[2].shiny = false
        trainer.party[2].item = :QUICKCLAW
        trainer.party[2].nature = :NAUGHTY
        trainer.party[2].calc_stats
      elsif puppet3 == 3
        trainer.party[2].species = :HEIRIN
        trainer.party[2].name = "HEirin"
        trainer.party[2].learn_move(:AQUASHOWER)
        trainer.party[2].learn_move(:HYPNOSIS)
        trainer.party[2].learn_move(:POISONBOMB)
        trainer.party[2].learn_move(:NIGHTSHADE)
        trainer.party[2].ev[:HP]              = 252
        trainer.party[2].ev[:ATTACK]          = 0
        trainer.party[2].ev[:DEFENSE]         = 6
        trainer.party[2].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[2].ev[:SPECIAL_DEFENSE] = 252
        trainer.party[2].ev[:SPEED]           = 0
        trainer.party[2].iv[:HP]              = 15
        trainer.party[2].iv[:ATTACK]          = 15
        trainer.party[2].iv[:DEFENSE]         = 15
        trainer.party[2].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[2].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[2].iv[:SPEED]           = 15
        trainer.party[2].ability_index = 0
        trainer.party[2].shiny = false
        trainer.party[2].item = :LEFTOVERS
        trainer.party[2].nature = :CALM
        trainer.party[2].calc_stats
      elsif puppet3 == 4
        trainer.party[2].species = :SKOMACHI
        trainer.party[2].name = "SKomachi"
        trainer.party[2].learn_move(:BATONPASS)
        trainer.party[2].learn_move(:AMNESIA)
        trainer.party[2].learn_move(:CUT)
        trainer.party[2].learn_move(:SPLASHING)
        trainer.party[2].ev[:HP]              = 6
        trainer.party[2].ev[:ATTACK]          = 252
        trainer.party[2].ev[:DEFENSE]         = 0
        trainer.party[2].ev[:SPECIAL_ATTACK]  = 0
        trainer.party[2].ev[:SPECIAL_DEFENSE] = 0
        trainer.party[2].ev[:SPEED]           = 252
        trainer.party[2].iv[:HP]              = 15
        trainer.party[2].iv[:ATTACK]          = 15
        trainer.party[2].iv[:DEFENSE]         = 15
        trainer.party[2].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[2].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[2].iv[:SPEED]           = 15
        trainer.party[2].ability_index = 1
        trainer.party[2].shiny = false
        trainer.party[2].item = :SALACBERRY
        trainer.party[2].nature = :HASTY
        trainer.party[2].calc_stats
      elsif puppet3 == 5
        trainer.party[2].species = :KYOUKO
        trainer.party[2].name = "Kyouko"
        trainer.party[2].learn_move(:PERFORMANCE)
        trainer.party[2].learn_move(:HYPERVOICE)
        trainer.party[2].learn_move(:BINDINGVOICE)
        trainer.party[2].learn_move(:SONICBOOM)
        trainer.party[2].ev[:HP]              = 0
        trainer.party[2].ev[:ATTACK]          = 0
        trainer.party[2].ev[:DEFENSE]         = 0
        trainer.party[2].ev[:SPECIAL_ATTACK]  = 252
        trainer.party[2].ev[:SPECIAL_DEFENSE] = 252
        trainer.party[2].ev[:SPEED]           = 6
        trainer.party[2].iv[:HP]              = 15
        trainer.party[2].iv[:ATTACK]          = 15
        trainer.party[2].iv[:DEFENSE]         = 15
        trainer.party[2].iv[:SPECIAL_ATTACK]  = 15
        trainer.party[2].iv[:SPECIAL_DEFENSE] = 15
        trainer.party[2].iv[:SPEED]           = 15
        trainer.party[2].ability_index = 0
        trainer.party[2].shiny = false
        trainer.party[2].item = :PETAYABERRY
        trainer.party[2].nature = :QUIET
        trainer.party[2].calc_stats
      end
    end
   }
 )
