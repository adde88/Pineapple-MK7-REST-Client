module PineAP_Actions

    public def enable()
        self.request(
            'PUT',
            'pineap/settings',
            {
                'mode' => "advanced",
                'settings' => {
                    'enablePineAP' => true,
                    'autostartPineAP' => false,
                    'armedPineAP' => false,
                    'ap_channel' => "11",
                    'karma' => false,
                    'logging' => false,
                    'connect_notifications' => false,
                    'disconnect_notifications' => false,
                    'capture_ssids' => false,
                    'beacon_responses' => false,
                    'broadcast_ssid_pool' => false,
                    'pineap_mac' => PineappleMK7::System::MAC,
                    'target_mac' => "FF:FF:FF:FF:FF:FF",
                    'beacon_response_interval' => "NORMAL",
                    'beacon_interval' => "NORMAL"
                }
            },
            '{"success":true}'
        )
    end

    public def startHandshakesCapture(ap)
        self.request(
            'POST',
            'pineap/handshakes/start',
            ap.to_h(),
            '{"success":true}'
        )
    end

    public def deauthAP(bssid, channel, clients)
        self.request(
            'POST',
            'pineap/deauth/ap',
            {
                'bssid' => bssid,
                'multiplier' => 5,
                'channel' => channel,
                'clients' => clients
            },
            '{"success":true}'
        )
    end

    public def deauthClient(bssid, channel, mac)
        self.request(
            'POST',
            'pineap/deauth/client',
            {
                'bssid' => bssid,
                'multiplier' => 5,
                'channel' => channel,
                'mac' => mac
                
            },
            '{"success":true}'
        )
    end

    public def stopHandshakesCapture()
        self.request(
            'POST',
            'pineap/handshakes/stop',
            {},
            '{"success":true}'
        )
    end

    public def getHandshakes()
        self.request(
            'GET',
            'pineap/handshakes',
            {},
            '{"handshakes":'
        )
    end

    public def filterClient(mode)
        self.request(
            'PUT',
            'pineap/filters/client/mode',
            {
                'mode' => mode
            },
            '{"success":true}'
        )
    end

    public def filterSSID(mode)
        self.request(
            'PUT',
            'pineap/filters/ssid/mode',
            {
                'mode' => mode
            },
            '{"success":true}'
        )
    end

    public def addSSID(ssid)
        self.request(
            'PUT',
            'pineap/ssids/ssid',
            {
                'ssid' => ssid
            },
            '{"success":true}'
        )
    end

    public def clearPool()
        self.request(
            'DELETE',
            'pineap/ssids',
            {},
            '{"success":true}'
        )
    end

    public def setRogue()
        self.request(
            'PUT',
            'pineap/settings',
            {
                'mode' => "advanced",
                'settings' => {
                    'enablePineAP' => true,
                    'autostartPineAP' => false,
                    'armedPineAP' => false,
                    'ap_channel' => "11",
                    'karma' => true,
                    'logging' => false,
                    'connect_notifications' => false,
                    'disconnect_notifications' => false,
                    'capture_ssids' => false,
                    'beacon_responses' => true,
                    'broadcast_ssid_pool' => true,
                    'pineap_mac' => PineappleMK7::System::MAC,
                    'target_mac' => "FF:FF:FF:FF:FF:FF",
                    'beacon_response_interval' => "AGGRESSIVE",
                    'beacon_interval' => "AGGRESSIVE"
                }
            },
            '{"success":true}'
        )
    end

    public def getClients()
        self.request(
            'GET',
            'pineap/clients',
            {},
            ''
        )
    end

    public def disable()
        self.request(
            'PUT',
            'pineap/settings',
            {
                'mode' => "advanced",
                'settings' => {
                    'enablePineAP' => false,
                    'autostartPineAP' => false,
                    'armedPineAP' => false,
                    'ap_channel' => "11",
                    'karma' => false,
                    'logging' => false,
                    'connect_notifications' => false,
                    'disconnect_notifications' => false,
                    'capture_ssids' => false,
                    'beacon_responses' => false,
                    'broadcast_ssid_pool' => false,
                    'pineap_mac' => PineappleMK7::System::MAC,
                    'target_mac' => "FF:FF:FF:FF:FF:FF",
                    'beacon_response_interval' => "NORMAL",
                    'beacon_interval' => "NORMAL"
                }
            },
            '{"success":true}'
        )
    end

end