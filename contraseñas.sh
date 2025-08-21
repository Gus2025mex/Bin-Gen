#!/data/data/com.termux/files/usr/bin/bash

echo -e "\e[35m
╭━━━╮
┃╭━╮┃
┃┃╱╰╋━━┳━╮
┃┃╭━┫┃━┫╭╮╮
┃╰┻━┃┃━┫┃┃┃
╰━━━┻━━┻╯╰╯
╭━━━╮╱╱╱╱╱╭╮
┃╭━╮┃╱╱╱╱╭╯╰╮
┃┃╱╰╋━━┳━╋╮╭╋━┳━━╮
┃┃╱╭┫╭╮┃╭╮┫┃┃╭┫╭╮┃
┃╰━╯┃╰╯┃┃┃┃╰┫┃┃╭╮┃
╰━━━┻━━┻╯╰┻━┻╯╰╯╰╯\e[0m"

echo -e "\e[31mGenerador de Contraseñas Gus\e[0m"

# Función para generar una contraseña segura con símbolos
generate_password() {
    pass=$(openssl rand -base64 12 | cut -c1-12)
    pass=$(echo "$pass" | tr -dc '[:alnum:]!@#$%^&*()-+=_')
    echo $pass
}

# Solicitar la cantidad de contraseñas a generar
echo "Ingrese la cantidad de contraseñas a generar:"
read quantity

# Crear un directorio en la tarjeta SD para guardar las contraseñas
mkdir -p /sdcard/contraseñas

# Generar y guardar las contraseñas
for ((i=1; i<=$quantity; i++)); do
    name=$(curl -s https://www.behindthename.com/random/random.php?gender=m&number=1&usage_lat=1 | grep -o '<span class="heavy">.*<\/span>' | sed 's/<[^>]*>//g')
    password=$(generate_password)
    echo "$name: $password" >> /sdcard/contraseñas/contraseñas.txt
done

echo "Contraseñas generadas y guardadas en /sdcard/contraseñas/contraseñas.txt"