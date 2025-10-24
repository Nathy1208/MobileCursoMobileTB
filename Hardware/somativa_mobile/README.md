# 📱 Somativa Mobile – Sistema de Registro de Ponto

Aplicativo Flutter desenvolvido para **registro de ponto com autenticação biométrica**, **verificação de localização (GPS)** e **integração Firebase**.  
O sistema permite que o usuário registre seu ponto apenas quando estiver dentro do raio autorizado e após confirmação por biometria.

---

## 🚀 Funcionalidades

- 🔐 **Autenticação Biométrica (Digital/FaceID)** – garante segurança antes do registro.  
- 📍 **Verificação de Localização (Geolocalização)** – calcula distância até o local de trabalho.  
- ☁️ **Integração com Firebase** – armazena registros de ponto em nuvem.  
- 🧭 **Controle de Distância Dinâmico** – mostra a distância atual em tempo real.  
- 🗓️ **Histórico de Registros** – salva data, hora, tipo de autenticação e localização.

---

## 🧩 Estrutura do Projeto

```
lib/
│
├── controllers/
│   ├── auth_controller.dart          # Controle de autenticação do usuário
│   └── point_controller.dart         # Controle de registro e cálculo de distância
│
├── models/
│   └── point_model.dart              # Estrutura de dados do ponto registrado
│
├── screens/
│   ├── login_screen.dart             # Tela de login
│   ├── register_point_screen.dart    # Tela de registro de ponto
│   └── home_screen.dart              # Tela inicial
│
├── services/
│   └── biometric_service.dart        # Serviço de autenticação biométrica
│
├── widgets/
│   └── custom_button.dart            # Componentes reutilizáveis
│
├── firebase_options.dart             # Configurações do Firebase
└── main.dart                         # Ponto de entrada do app
```

---

## ⚙️ Dependências

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.14.0
  firebase_auth: ^4.7.0
  cloud_firestore: ^4.8.0
  geolocator: ^9.0.2
  local_auth: ^2.1.0
  provider: ^6.0.5
  intl: ^0.18.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  integration_test:
```

---


## ▶️ Execução do Projeto

1. Instale as dependências:
   ```bash
   flutter pub get
   ```

2. Execute o app:
   ```bash
   flutter run
   ```

3. Se precisar atualizar as dependências:
   ```bash
   flutter pub upgrade
   ```

---

## 🧠 Autores

**Desenvolvido por:**  
👩‍💻 Nathaly Smanioto  

---
