if test "$PROXY_HOST" && ping -q -c 1 -W 0.1 $PROXY_HOST > /dev/null 2>&1 ; then
    echo "at work"
    export http_proxy="http://$LDAP_USER:$LDAP_PASSWORD@$PROXY_HOST:$PROXY_PORT"
    export https_proxy="http://$LDAP_USER:$LDAP_PASSWORD@$PROXY_HOST:$PROXY_PORT"
else
    echo "not at work"
    unset http_proxy
    unset https_proxy
fi
