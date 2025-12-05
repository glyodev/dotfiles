#!/bin/bash
 
# yay -S davinci-resolve-studio   - si falla prueba instalando manualmente las dependencias
 
# yay -S apr-util ffmpeg4.4 fuse2 glu gst-plugins-bad-libs gtk2 jdk-openjdk libc++ libc++abi libpng12 libxcrypt-compat luajit qt5-multimedia qt5-quickcontrols2 qt5-svg qt5-webengine qt5-websockets qt5-x11extras tbb xmlsec libarchive patchelf xdg-user-dirs
 
# PARA AMD
# yay -S amf-amdgpu-pro amdgpu-pro-oglp lib32-amdgpu-pro-oglp vulkan-amdgpu-pro lib32-vulkan-amdgpu-pro opencl-amd
 
# PARA NVIDIA 
# yay -S nvidia nvidia-utils lib32-nvidia-utils nvidia-settings opencl-nvidia lib32-opencl-nvidia
 
# PARA INTEL NO SE SI FUNCIONA 
# yay -S vulkan-intel lib32-vulkan-intel vulkan-tools intel-media-driver libva-intel-driver opencl-mesa opencl-rusticl-mesa
# yay -S intel-compute-runtime
 
# Fuente: https://wiki.archlinux.org/title/DaVinci_Resolve
 
# Cambiar a modo superusuario
sudo su <<EOF
 
# Cambiar al directorio /opt/resolve
cd /opt/resolve
 
# Ejecutar los comandos perl para modificar el archivo bin/resolve
sudo perl -pi -e 's/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\x74\x11\x48\x8B\x45\xC8\x8B/\x03\x00\x89\x45\xFC\x83\x7D\xFC\x00\xEB\x11\x48\x8B\x45\xC8\x8B/' bin/resolve
sudo perl -pi -e 's/\x74\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/\xEB\x11\x48\x8B\x45\xC8\x8B\x55\xFC\x89\x50\x58\xB8\x00\x00\x00/' bin/resolve
sudo perl -pi -e 's/\x41\xb6\x01\x84\xc0\x0f\x84\xb0\x00\x00\x00\x48\x85\xdb\x74\x08\x45\x31\xf6\xe9\xa3\x00\x00\x00/\x41\xb6\x00\x84\xc0\x0f\x84\xb0\x00\x00\x00\x48\x85\xdb\x74\x08\x45\x31\xf6\xe9\xa3\x00\x00\x00/' bin/resolve
 
# Crear el archivo de licencia
echo -e "LICENSE blackmagic davinciresolvestudio 999999 permanent uncounted\n  hostid=ANY issuer=CGP customer=CGP issued=28-dec-2023\n  akey=0000-0000-0000-0000 _ck=00 sig=\"00\"" | sudo tee .license/blackmagic.lic
 
cd /opt/resolve/libs
mkdir disabled-libraries
mv libglib* disabled-libraries
mv libgio* disabled-libraries
mv libgmodule* disabled-libraries
 
EOF

# sudo pacman -S downgrade
# downgrade libc++ & libc++abi to 20.1.6
# sudo downgrade libc++ libc++abi
