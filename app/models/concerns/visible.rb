  module Visible
    extend ActiveSupport::Concern    #module >> include (private methods) -- extend (static metod)
  
    VALID_STATUSES = ['public', 'private', 'archived']
  
    included do
      validates :status, inclusion: { in: VALID_STATUSES }
    end
  
    class_methods do       #static methods container
      def public_count
        where(status: 'public').count
      end
    end
  
    def archived?
      status == 'archived'
    end
  end
  
  