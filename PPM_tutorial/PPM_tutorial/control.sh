#!/bin/bash
#Base PPM path
Path_basePPM="../../"
#Input file name
InputFile="Input.cube"
#Text file containing the paths
FileVarAuto="VarAuto.py"
#Text file containing the params
FileVarUser="VarUser.py"

#Name of the FileVarAuto file
echo FileVarAuto=\'$FileVarAuto\' > $FileVarAuto
#Name of the input file
echo InputFile=\'$InputFile\' >> $FileVarAuto
#Path to basePPM code, relative to the simulation folder
echo Path_basePPM=\'$Path_basePPM\' >> $FileVarAuto
#Absolute path to the simulation folder
echo PathAbs_simulation=\'$(pwd)\' >> $FileVarAuto
#Loading in the paths above
source $FileVarAuto

#Relaive path from the simulation folder to PPMadditions
echo PathRel_PPMadditions=\'$Path_basePPM/PPMadditions/\' >> $FileVarAuto
#Loading in the paths above
source $FileVarAuto

#Relaive paths from the simulation folder to bashScripts, pyScripts, pyFunctions, CustomColourmaps
echo PathRel_bashScripts=\'$PathRel_PPMadditions/bashScripts/\' >> $FileVarAuto
echo PathRel_pyScripts=\'$PathRel_PPMadditions/pyScripts/\' >> $FileVarAuto
echo PathRel_pyFunctions=\'$PathRel_PPMadditions/pyFunctions/\' >> $FileVarAuto
echo PathRel_CustomColourmaps=\'$PathRel_PPMadditions/CustomColourmaps/\' >> $FileVarAuto
echo PathRel_MasterCopies=\'$PathRel_PPMadditions/MasterCopies/\' >> $FileVarAuto
#Loading in all paths
source $FileVarAuto

#Printing all variables
echo "PathAbs_simulation   = "$PathAbs_simulation
echo "Path_basePPM         = "$Path_basePPM
echo "PathRel_PPMadditions = "$PathRel_PPMadditions
echo "PathRel_bashScripts  = "$PathRel_bashScripts
echo "PathRel_pyScripts    = "$PathRel_pyScripts
echo "PathRel_pyFunctions  = "$PathRel_pyFunctions
echo "PathRel_CustomCmaps  = "$PathRel_CustomColourmaps
echo
echo
#Making the directory for the stats files
mkdir Stats

#RAM intensive part of the PPM simulation (base PPM+efficiency code)
bash $PathRel_bashScripts/statsRAM.sh

#CPU intensive part of the PPM simulation (Rendering the 3D images)
bash $PathRel_bashScripts/statsCPU.sh

