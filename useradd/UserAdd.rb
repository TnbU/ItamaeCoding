execute 'createuser' do
  not_if "id user"
  user "root"
  command <<-EOS
  useradd user
EOS
end

execute 'adduseradd' do
  user "root"
  command <<-EOS
  chpasswd < /home/itamae/useradd/ProfileData.txt
EOS
end
