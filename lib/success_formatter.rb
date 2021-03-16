class SuccessFormatter
  def self.call(result)
    {
      json: {
        result: result
      }
    }
  end
end