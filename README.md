# 👽 Terminal Setup (WSL / Ubuntu)

Mój spersonalizowany setup terminala oparty o **Zsh**, **Oh My Zsh** i **Oh My Posh**.

## 🛠️ Instalacja na Windows (Czcionki)
Aby ikony wyświetlały się poprawnie, musisz zainstalować **Hack Nerd Font**:
1. Otwórz PowerShell jako **Administrator**.
2. Uruchom: `.\install_fonts.ps1`.
3. W ustawieniach Windows Terminal wybierz czcionkę **Hack NF**.

## 🐧 Instalacja na WSL / Linux VM
1. Sklonuj repozytorium:
   ```bash
   git clone [https://github.com/TWOJ_LOGIN/NAZWA_REPO.git](https://github.com/TWOJ_LOGIN/NAZWA_REPO.git) && cd NAZWA_REPO
   chmod +x install_linux.sh
   ./install_linux.sh
   chsh -s $(which zsh)


   Najważniejsze Skróty i Aliasy
Nawigacja i Historia

    CTRL + R: Przeszukiwanie historii komend przez fzf.

    z nazwa_folderu: Szybkie skakanie do najczęściej używanych katalogów (plugin z).

    CTRL + T: Wyszukiwanie ścieżki do pliku i wklejanie jej pod kursor.

Python & Flask

    venv: Tworzy i aktywuje środowisko wirtualne (python3 -m venv venv).

    vact: Szybka aktywacja istniejącego venv (source venv/bin/activate).

    frun: Uruchamia aplikację Flask (flask run).

Systemowe

    szsh: Przeładowanie konfiguracji terminala (source ~/.zshrc).

    zshconfig: Szybka edycja ustawień terminala.

    pp_json: Ładne formatowanie JSON-a w konsoli.
