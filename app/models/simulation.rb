class Simulation < ActiveRecord::Base
  before_save :calc_icbm_avail, :calc_subs_at_sea, :calc_weaps_at_sea, 
              :calc_subs_plus_icbms, :calc_subs_plus_bombs, :calc_subs_navy
              :calc_subs_mirv, :calc_red_blue_icbms, :calc_red_first_strike

  def calc_icbm_avail
    unless self.icbmMax.blank? || self.icbmProb.blank? || self.icbmMirv.blank?
      self.icbmAvail = (self.icbmMax * self.icbmProb * self.icbmMirv).ceil
    end
  end

  def calc_subs_at_sea
    unless self.subsOperational.blank? || self.subsSeaRate.blank?
      if self.subsRoundUp
        self.subsAtSea = (subsOperational * self.subsSeaRate).ceil
      else
        self.subsAtSea = (subsOperational * self.subsSeaRate).floor
      end
    end
  end

  def calc_weaps_at_sea
    unless self.subsMirv.blank? || self.subsTubes.blank? || self.subsAtSea.blank?
      self.subsWeaps = self.subsMirv * self.subsTubes * self.subsAtSea
    end
  end

  def calc_subs_plus_icbms
    unless self.subsWeaps.blank? || self.icbmAvail.blank?
      self.subsPlusIcbms = self.subsWeaps * self.icbmAvail
    end
  end

  def calc_subs_plus_bombs
    unless self.subsPlusIcbms.blank?
      if self.bombsPostStrike.blank?
        self.subsPlusBombs = self.subsPlusIcbms + self.bombsNumber
      else
        self.subsPlusBombs = self.subsPlusIcbms + self.bombsPostStrike
      end
    end
  end

  def calc_subs_navy
    unless self.icbmMax.blank? || self.blueInventory.blank?
      self.subsNavy = self.blueInventory - self.icbmMax
    end
  end

  def calc_subs_mirv
    unless self.subsNavy.blank? || self.subsOperational.blank? || self.subsTubes.blank?
      self.subsMirv = self.subsNavy / (self.subsOperational * self.subsTubes)
    end
  end

  def calc_red_blue_icbms
    unless self.icbmMax.blank? || self.redRatio.blank?
      if self.redTarget
        self.redBlueIcbms = (self.icbmMax * self.redRatio) + (self.icbmMax / 10)
      else
        self.redBlueIcbms = self.icbmMax * self.redRatio
      end
    end
  end

  def calc_red_first_strike
    if self.icbmBlueLaunch
      self.redFirstStrike = self.redInventory - self.redBlueIcbms - self.icbmAvail
    else
      self.redFirstStrike = self.redInventory - self.redBlueIcbms
    end
  end
end
