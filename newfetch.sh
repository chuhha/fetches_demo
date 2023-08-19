#!/bin/bash

# Вывод информации о системе и компьютере
echo "=== Информация о системе ==="
echo "Операционная система: $(uname -s)"
echo "Версия ядра: $(uname -r)"
echo "Версия дистрибутива: $(lsb_release -ds)"
echo "Архитектура процессора: $(uname -m)"

echo "=== Информация о компьютере ==="
echo "Имя хоста: $(hostname)"
echo "Локальный IP-адрес: $(hostname -I | awk '{print $1}')"
echo "Внешний IP-адрес: $(curl -s ifconfig.me)"

echo "=== Информация о процессоре ==="
echo "Модель процессора: $(cat /proc/cpuinfo | grep "model name" | head -1 | awk -F: '{print $2}' | awk '{$1=$1};1')"
echo "Частота процессора: $(lscpu | grep "CPU MHz" | awk '{print $3}') МГц"
echo "Количество ядер: $(nproc)"

echo "=== Информация о памяти ==="
echo "Всего памяти: $(free -h | grep Mem | awk '{print $2}')"
echo "Использовано памяти: $(free -h | grep Mem | awk '{print $3}')"
echo "Доступно памяти: $(free -h | grep Mem | awk '{print $4}')"

echo "=== Информация о жёстком диске ==="
echo "Всего места на диске: $(df -h --total | grep total | awk '{print $2}')"
echo "Использовано места на диске: $(df -h --total | grep total | awk '{print $3}')"
echo "Доступно места на диске: $(df -h --total | grep total | awk '{print $4}')"

echo "=== Информация о графической карте ==="
echo "Модель графической карте: $(lspci | grep VGA | awk '{$1=$2=$3="";print $0}' | awk '{$1=$1};1')"

echo "=== Информация о сетевых интерфейсах ==="
ip -o addr show | awk '{print $2, $4}' | grep "inet "

echo "=== Информация о звуковой карте ==="
echo "Модель звуковой карты: $(lspci | grep -i audio | awk '{$1=$2=$3="";print $0}' | awk '{$1=$1};1')"

echo "=== Информация о USB-устройствах ==="
lsusb