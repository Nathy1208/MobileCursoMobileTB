# 📲 Somativa Mobile – Sistema de Registro de Ponto com Geolocalização e Biometria

Aplicativo desenvolvido em **Flutter** com integração ao **Firebase**, projetado para registrar pontos de funcionários com **autenticação biométrica** e **verificação de localização**.  
O app garante que o registro de ponto só ocorra dentro de um raio de segurança e de forma autenticada, evitando fraudes e erros de registro.

---

## 🧩 RELATÓRIO DE IMPLEMENTAÇÃO

### 🔧 Descrição Técnica das Funcionalidades Implementadas

#### 1. **Autenticação com Firebase**
- O login é gerenciado pelo **Firebase Authentication**, permitindo que cada colaborador tenha uma conta única.
- O controlador `AuthController` centraliza as operações de login, logout e acesso ao `uid` do usuário.
- Foi adotado o **Provider** como gerenciador de estado para disponibilizar o `AuthController` globalmente.

#### 2. **Registro de Ponto**
- Implementado na tela `RegisterPointScreen`, que faz o fluxo:
  1. Captura da localização atual com `geolocator`.
  2. Verificação da distância entre o ponto atual e a empresa.
  3. Autenticação biométrica com `local_auth`.
  4. Armazenamento do registro no **Firebase Firestore**.

#### 3. **Serviço de Biometria**
- Implementado em `biometric_service.dart`.
- Usa a API `local_auth` para solicitar autenticação via digital ou reconhecimento facial.
- Caso o dispositivo não suporte biometria, o app informa o usuário e impede o registro.

#### 4. **Geolocalização**
- Utiliza o pacote `geolocator` para obter coordenadas em tempo real.
- Cálculo de distância com base nas coordenadas da empresa.
- Caso o usuário esteja fora do limite configurado (100m), o botão de “Confirmar Registro” é desabilitado.

#### 5. **Banco de Dados – Cloud Firestore**
- Cada registro contém:
  ```json
  {
    "userId": "uid",
    "latitude": -23.5489,
    "longitude": -46.6388,
    "distance": 53.2,
    "method": "biometria",
    "timestamp": "2025-10-16T14:30:00Z"
  }
  ```
- Os registros ficam organizados por coleções de usuários (`users/{uid}/pontos`).

---

## 🎨 Decisões de Design e Arquitetura

| Componente | Decisão | Justificativa |
|-------------|----------|---------------|
| **Gerenciamento de estado** | `Provider` | Simples, eficiente e integrado com Firebase |
| **Layout** | `Material Design` | Mantém consistência com padrões Android |
| **Armazenamento** | Firestore (cloud) | Evita dados locais e permite histórico centralizado |
| **Autenticação biométrica** | `local_auth` | Fornece API confiável e segura |
| **Cálculo de distância** | `Geolocator` | API nativa, precisa e multiplataforma |

---

## ☁️ ESPECIFICAÇÃO DE USO DE APIS E INTEGRAÇÕES

### 🔥 Firebase

| Serviço | Uso | Arquivo relacionado |
|----------|-----|--------------------|
| **Authentication** | Gerencia login e autenticação biométrica combinada | `auth_controller.dart` |
| **Cloud Firestore** | Armazena registros de ponto | `point_controller.dart` |
| **Firebase Core** | Inicializa o SDK | `main.dart` |

Configuração feita com:
```bash
flutterfire configure
```

---

### 📍 API de Geolocalização (`geolocator`)
- Permite obter a latitude e longitude em tempo real.  
- Exige permissões no `AndroidManifest.xml`:
  ```xml
  <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
  <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
  ```
- Métodos principais:
  - `Geolocator.getCurrentPosition()`
  - `Geolocator.distanceBetween()`

---

### 🔒 API de Biometria (`local_auth`)
- Permite autenticação com **impressão digital** ou **reconhecimento facial**.
- Código base:
  ```dart
  final auth = LocalAuthentication();
  bool canCheck = await auth.canCheckBiometrics;
  bool didAuthenticate = await auth.authenticate(
    localizedReason: 'Confirme sua identidade para registrar o ponto',
  );
  ```
- Permissões:
  ```xml
  <uses-permission android:name="android.permission.USE_BIOMETRIC"/>
  ```

---

## 🧠 DESAFIOS E SOLUÇÕES

| Desafio | Solução Adotada |
|----------|-----------------|
| **Erro no `flutterfire configure` por falta de plataforma selecionada** | Executar novamente o comando e marcar `android` e `web` |
| **Falha ao criar app no Firebase CLI** | Verificar credenciais e nome do pacote em `android/app/build.gradle` |
| **Permissões de GPS não funcionando no emulador** | Teste feito com coordenadas fixas de São Paulo (-23.5489, -46.6388) |
| **Erro de autenticação biométrica em modo debug** | Adicionado fallback de autenticação via NIF |
| **Sincronização incorreta com Firestore** | Ajustado await/async nas funções de `savePoint` |

---

## ⚙️ DOCUMENTAÇÃO DE INSTALAÇÃO E USO

### 📦 1. Requisitos
- Flutter 3.0 ou superior  
- Android Studio ou VS Code  
- Conta no Firebase  
- Dispositivo ou emulador com suporte a biometria  

---


### 🔥 3. Configurando o Firebase

1. Acesse [Firebase Console](https://console.firebase.google.com/).  
2. Crie um projeto chamado **somativ-primeiro**.  
3. Adicione um app Android com o pacote do seu projeto (`com.example.primeiro`).  
4. Baixe o arquivo `google-services.json` e coloque em:
   ```
   android/app/google-services.json
   ```
5. Configure o Gradle:
   ```gradle
   dependencies {
       classpath 'com.google.gms:google-services:4.4.2'
   }
   ```
   E em `app/build.gradle`:
   ```gradle
   apply plugin: 'com.google.gms.google-services'
   ```

6. Gere a configuração automática:
   ```bash
   flutterfire configure
   ```

---

### 📍 4. Configurando Permissões

No `android/app/src/main/AndroidManifest.xml`, adicione:

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.USE_BIOMETRIC"/>
<uses-permission android:name="android.permission.INTERNET"/>
```

---

### ▶️ 5. Executando o Aplicativo

```bash
flutter run
```

O app será iniciado e você poderá:
1. Fazer login com o Firebase.
2. Ativar a biometria.
3. Registrar o ponto (apenas dentro da área permitida).

---

## 🧩 TESTES REALIZADOS

| Tipo | Descrição | Resultado |
|------|------------|------------|
| Autenticação Firebase | Login e logout de usuários | ✅ Sucesso |
| Biometria | Teste de autenticação digital/facial | ✅ Sucesso |
| Geolocalização | Cálculo de distância e verificação de raio | ✅ Sucesso |
| Firestore | Armazenamento e leitura de registros | ✅ Sucesso |

---

## 👩‍💻 EQUIPE DE DESENVOLVIMENTO

| Nome | Função |
|------|--------|
| Nathaly Smanioto | Desenvolvedora Flutter |

---
