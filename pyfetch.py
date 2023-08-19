import platform
import psutil
import tkinter as tk

def get_system_info():
    system_info = {}
    
    # Определение операционной системы
    system_info["OS"] = platform.system()
    
    # Характеристики ПК
    system_info["CPU"] = platform.processor()
    system_info["RAM"] = str(round(psutil.virtual_memory().total / (1024**3))) + " GB"
    system_info["Disk"] = str(round(psutil.disk_usage('/').total / (1024**3))) + " GB"
    
    # Основная информация о системе
    system_info["Python Version"] = platform.python_version()
    
    return system_info

def display_system_info():
    system_info = get_system_info()
    
    root = tk.Tk()
    root.title("System Information")
    
    for i, (key, value) in enumerate(system_info.items()):
        label = tk.Label(root, text=key + ": " + value)
        label.pack()
    
    root.mainloop()

display_system_info()