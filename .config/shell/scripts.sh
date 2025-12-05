# SCRIPTS

_wifi_conn_complete() {
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=$(nmcli -t -f ssid dev wifi list | cut -d ':' -f 2)

    # Si la palabra anterior es 'wifi-conn' y estamos en el primer argumento,
    # permitir la autocompletación sin dividir los nombres de red que contienen espacios.
    if [[ ${cur} == * && ${prev} == 'wifi-conn' && ${COMP_CWORD} -eq 1 ]] ; then
        local IFS=$'\n'  # Establecer el separador de campos interno para nombres de red con espacios
        COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
        return 0
    fi
}
complete -F _wifi_conn_complete wifi-conn