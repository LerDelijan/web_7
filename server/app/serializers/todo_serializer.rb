class TodoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text, :done, :time, :starttime, :donetime
end
