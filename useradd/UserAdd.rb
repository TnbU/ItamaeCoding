execute 'createuser' do
  not_if "id samplemen"
  user "root"
  command <<-EOS
  useradd samplemen
EOS
end

execute 'adduseradd' do
  user "root"
  command <<-EOS
  chpasswd < /home/itamae/useradd/ProfileData.txt
EOS
end
