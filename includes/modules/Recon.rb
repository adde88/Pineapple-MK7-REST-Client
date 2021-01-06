module Recon_Actions

    public def startScan(time)
        self.request(
            'POST',
            'recon/start',
            {
                'live' => false,
                'scan_time' => time,
                'band' => "0"
            },
            '{"scanRunning":true,"scanID":'
        )
        sleep(time + 15)
        return @body
    end

    public def getResults(scanID)
        self.request(
            'GET',
            'recon/scans/' + scanID.to_s(),
            {},
            '{"APResults":'
        )
    end
    
    public def deleteScan(scanID)
        self.request(
            'DELETE',
            'recon/scans/' + scanID.to_s(),
            {},
            '{"success":true}'
        )
    end

end
