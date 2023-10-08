 
import subprocess
import time

# Set the MAC address of your PS4 controller
controller_mac_address = 'MAC ADRES HERE'  # Replace with your controller's MAC address

def pair_ps4_controller():
    try:
        # Put your Bluetooth adapter into pairing mode
        subprocess.call(['bluetoothctl', 'discoverable', 'on'])

        # Put the controller into pairing mode (hold the Share and PS buttons simultaneously)
        print('Put the PS4 controller into pairing mode (hold Share + PS buttons)')
        time.sleep(10)  # You have 10 seconds to put the controller into pairing mode

        # Pair the controller with your computer
        subprocess.call(['bluetoothctl', 'pair', controller_mac_address])
        subprocess.call(['bluetoothctl', 'connect', controller_mac_address])

        print('PS4 controller paired successfully!')

    except Exception as e:
        print(f'Error: {str(e)}')

if __name__ == '__main__':
    pair_ps4_controller()
