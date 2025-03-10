#!/bin/bash
#  Executa amb ./check-software-packages.sh
# Aquest script defineix una llista de paquets segons la sol·licitud
# i comprova, per a cada element, si aquest es troba instal·lat en el sistema.
#
# Nota: Els noms dels paquets s’han inclòs tal com s’han proporcionat.
# És possible que sigui necessari modificar-los per adaptar-los als noms reals
# utilitzats pel sistema de gestió de paquets d’Ubuntu.

# Definició de la llista de paquets sense comes!
PACKAGES=("iperf3" "remmina" "inkscape" "librecad" "meld" "mtr" "mysql-workbench" "openscad" "planner" "blender" "bluefish" "codeblocks" "dia" "dig" "dnsutils" "evolution" "filezilla" "freecad" "geany" "ghex" "giggle" "gimp" "glogg" "gtkterm" "idle" "imagemagick" "thonny" "tigervnc-standalone-server" "virt-manager")
    
# Funció per comprovar si un paquet està instal·lat
check_package() {
    local package_name="$1"
    # Extrau la llista de noms dels paquets instal·lats
    installed_packages=$(dpkg -l | awk 'NR>5 {print $2}')
    # Comprova si el nom del paquet coincideix exactament i silencia la sortida
    if echo "$installed_packages" | grep -Fxq "$package_name"; then
        echo "✅ El paquet '$package_name' està instal·lat."
    else
        echo "❌ El paquet '$package_name' NO està instal·lat."
    fi
}

# Actualitza la llista de paquets
sudo apt update

# Itera sobre la llista de paquets i comprova cadascun
for pkg in "${PACKAGES[@]}"; do
    check_package "$pkg"
done
