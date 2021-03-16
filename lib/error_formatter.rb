class ErrorFormatter
  def self.call(e)
    {
      json: {
        error: e.class.to_s,
        message: e.message,
        status: e.class.method_defined?(:status) ? e.status : 500,
        traces: e.backtrace[0..1],
        exception: e,
        timestamp: Time.now.localtime
      },
      status: 500
    }
    
  end
end