#!/bin/bash

# Define command colors
readonly COLOR_RED=`tput setaf 1`
readonly COLOR_GREEN=`tput setaf 2`
readonly COLOR_RESET=`tput sgr0`

# Define sample files
readonly XML_COLORS="<?xml version=\"1.0\" encoding=\"utf-8\"?>
<resources>
    <color name=\"xyz\">#979797</color>
    <color name=\"xyz_material\" type=\"material\">#CF2A2A</color>
</resources>"

readonly DART_DIMENS="class AppDimen {
  AppDimen._();
  static const double xyz = 16.0;
}"

function throw()
{
	echo "${COLOR_RED}Error!${COLOR_RESET}"
  exit $1
}

echo "${COLOR_GREEN}Creating project...${COLOR_RESET}"

# Resouces
echo "${COLOR_GREEN}Resouces${COLOR_RESET}"
echo "Create directories"
mkdir -p assets assets/fonts assets/images assets/images/2.0x assets/images/3.0x assets/launchers assets/colors assets/dimens || throw

echo "Create sample files: colors, dimens"
touch assets/colors/colors.xml; echo "$XML_COLORS" > assets/colors/colors.xml || throw

touch assets/dimens/dimens.dart; echo "$DART_DIMENS" > assets/dimens/dimens.dart || throw

# Success
echo "${COLOR_GREEN}Success!${COLOR_RESET}"