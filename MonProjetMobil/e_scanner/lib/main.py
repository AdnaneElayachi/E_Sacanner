# main.py

import kivy
from kivy.app import App
from kivy.uix.label import Label
from kivy.uix.button import Button
from kivy.uix.boxlayout import BoxLayout

import socket

kivy.require('1.11.1')


class MyApp(App):
    def build(self):
        layout = BoxLayout(orientation='vertical')
        self.label = Label(text='Waiting for data...')
        self.button = Button(text='Start OCR', on_press=self.start_ocr)
        layout.add_widget(self.label)
        layout.add_widget(self.button)
        return layout

    def start_ocr(self, instance):
        # Start a socket server to listen for data from Flutter
        server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        server_socket.bind(('127.0.0.1', 12345))
        server_socket.listen(1)
        self.label.text = 'Waiting for connection...'
        client_socket, addr = server_socket.accept()
        self.label.text = 'Connected to Flutter!'

        # Receive data from Flutter (replace this with your OCR logic)
        data = client_socket.recv(1024).decode('utf-8')
        self.label.text = f'Received data from Flutter: {data}'

        # Close the connection
        client_socket.close()
        server_socket.close()


if __name__ == '__main__':
    MyApp().run()
