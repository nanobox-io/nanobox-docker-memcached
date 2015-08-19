
service 'cache' do
  action :enable
  init 'runit'
end
