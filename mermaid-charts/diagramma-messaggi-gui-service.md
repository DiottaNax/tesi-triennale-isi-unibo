:::mermaid
sequenceDiagram
    participant GUI as Interfaccia Grafica
    participant Service as Servizio Windows

    Note over GUI,Service: L'utente registra un nuovo dispositivo
    GUI->>+Service: Registration { deviceKey: string, deviceName: string }
    Service-->>-GUI: Response { success: bool, message: string }

    Note over GUI,Service: L'utente avvia la protezione
    GUI->>+Service: Start Protection 
    Service-->>-GUI: Response { success: bool, message: string }

    Note over GUI,Service: L'utente interrompe la protezione con PIN
    GUI->>+Service: Stop Protection { pin: int }
    Service-->>-GUI: Response { success: bool, message: string }

    Note over GUI,Service: L'utente richiede lo stato attuale della protezione
    GUI->>+Service: Get Status
    Service-->>-GUI: Response { status: string }
:::