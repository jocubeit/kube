module Kube
  module Version
    Major       = 6
    Minor       = 5
    Patch       = 2
    Revision    = 0
    Compact     = [Major, Minor, Patch, Revision].compact.join('.')
    Summary     = "Kube RubyGem v#{Compact}"
    Description = 'Imperavi Kube CSS & JS framework for the Rails asset pipeline.'
  end
end
