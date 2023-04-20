module AuthTokenHelper
    def new_token_string
        token_string = ""
        characters = [*('a'..'z'), *('A'..'Z'), *('0'..'9')]
        length = 16
    
        length.times do
          token_string << characters.sample
        end

        token_string
    end
end
