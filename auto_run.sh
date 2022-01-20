 #!/bin/bash


# Defined command colors
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

function throw()
{
	echo "${red}Error!${reset}"
    exit $1
}

echo "${green}Creating project...${reset}"

# Resouces
echo "${green}Resouces${reset}"
echo "Create directories"
mkdir -p assets assets/fonts assets/images assets/images/2.0x assets/images/3.0x assets/launchers assets/colors assets/dimens || throw

echo "Create sample files: colors, dimens"
touch assets/colors/colors.xml; echo "<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="xyz">#979797</color>
    <color name="xyz_material" type="material">#CF2A2A</color>
</resources>" > assets/colors/colors.xml || throw

touch assets/dimens/dimens.dart; echo "class AppDimen {
  AppDimen._();
  static const double xyz = 16.0;
}" > assets/dimens/dimens.dart || throw

# Success
echo "${green}Success!${reset}"