class Transfer < ApplicationRecord
	enum :status, [:recived , :transfered]
end
