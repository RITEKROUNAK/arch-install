REGION=Asia
CITY=Kolkata
HOSTNAME=archbox

echo "Linking time zone: $REGION/$CITY"
cat /usr/share/zoneinfo/$REGION/$CITY

echo "Syncing hw clock"
hwclock --systohc

echo "Generating locales..."
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "Setting up hostname"
echo $HOSTNAME > /etc/hostname

echo "Set password :"
passwd
