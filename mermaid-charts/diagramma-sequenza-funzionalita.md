
:::mermaid
sequenceDiagram
  actor U as Utente
  participant CS as ClientShield
  participant FS as Server FlashStart
  autonumber
  loop Finché la protezione è attiva
    U ->>+ CS: Richiesta DNS per un dominio
    Note right of U: L'utente (o browser) genera<br/>la richiesta per risolvere un dominio
    CS ->>+ FS: Richiesta DoH (DNS-over-HTTPS)
    Note right of CS: ClientShield inoltra la richiesta<br/>tramite DoH a FlashStart
    FS -->>- CS: Risposta DoH (IP o Stop Page)
    Note right of FS: FlashStart risponde con l'IP reale<br/>oppure un IP di blocco (Stop Page)
    CS -->>- U: Risposta DNS (IP reale o di blocco)
    Note right of CS: ClientShield ritorna all'utente<br/>l'indirizzo opportuno (o la Stop Page)
    U ->>+ U: Accesso alla pagina web
    Note right of U: L'utente accede al sito se<br/>non è stato bloccato
  end
:::