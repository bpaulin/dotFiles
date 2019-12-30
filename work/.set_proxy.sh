if test "$PROXY_HOST" && ping -q -c 1 -W 0.5 $PROXY_HOST > /dev/null 2>&1 ; then
    echo "at work"
    export http_proxy="http://$LDAP_USER:$LDAP_PASSWORD@$PROXY_HOST:$PROXY_PORT"
    export https_proxy="http://$LDAP_USER:$LDAP_PASSWORD@$PROXY_HOST:$PROXY_PORT"
    export ssh_proxy_command="corkscrew $PROXY_HOST $PROXY_PORT %h %p $HOME/.ssh/auth"
    echo "$LDAP_USER:$LDAP_PASSWORD" > ~/.ssh/auth
else
    echo "not at work"
    unset http_proxy
    unset https_proxy
    unset ssh_proxy_command
fi
