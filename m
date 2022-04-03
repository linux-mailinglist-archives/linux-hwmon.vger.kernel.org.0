Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 601AD4F0C9F
	for <lists+linux-hwmon@lfdr.de>; Sun,  3 Apr 2022 23:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356590AbiDCVi7 (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Sun, 3 Apr 2022 17:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiDCVi7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 3 Apr 2022 17:38:59 -0400
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com [192.185.193.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B2E39BA2
        for <linux-hwmon@vger.kernel.org>; Sun,  3 Apr 2022 14:37:04 -0700 (PDT)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway30.websitewelcome.com (Postfix) with ESMTP id 814C9A562
        for <linux-hwmon@vger.kernel.org>; Sun,  3 Apr 2022 16:37:02 -0500 (CDT)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
        by cmsmtp with SMTP
        id b7uAnMCKGXvvJb7uAnQfqW; Sun, 03 Apr 2022 16:37:02 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=lF9BzCq2uT0bqr6vwZa0EbW35dBqs5bHqbZa+xrEHSk=; b=ytZJFSxONMB069K0UT8lIYt7tZ
        zk/WytFIi3lFyLFel3b8X9/0kRYTNCuROLA4T1O7AzL4KCFUGqzmVBaI34msqGJMNZ96cVD+K5pKI
        /XmzMKF9MJuJzGNAuGyN+kdISPcQIUDrbhWxc6x46fGi1Na1ffctTa8Nkk+n4w0YIfqw1/8nTCxCY
        iI6kSiBSHHNVbRG/LHUv7Aosy2FGYk2nWI1gs2GwWrkyJ9hyKKj1fdByyf7p65icxYjBxxsyUWuDB
        iEYEEtoL2bB68JmbSqhbFqgsFwabQoT4bh5uBFj50Q5FT90g1AS3eTH9uA6IFA2JrldQjPh++QuWF
        bkaTnTNQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:57828 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@roeck-us.net>)
        id 1nb7uA-003AOd-2p; Sun, 03 Apr 2022 21:37:02 +0000
Date:   Sun, 3 Apr 2022 14:37:00 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wei Shuyu <wsy@dogben.com>
Cc:     linux-hwmon@vger.kernel.org, eugene.shalygin@gmail.com,
        pauk.denis@gmail.com, jdelvare@suse.com, oleksandr@natalenko.name
Subject: Re: [PATCH] hwmon:(asus-ec-sensors) Add T_Sensor for ASUS WS
 X570-ACE/PRIME
Message-ID: <20220403213700.GA2964607@roeck-us.net>
References: <E1nY43Q-000rAm-9a@dogben.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1nY43Q-000rAm-9a@dogben.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nb7uA-003AOd-2p
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:57828
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 15
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Mar 26, 2022 at 06:24:05PM +0800, Wei Shuyu wrote:
> WS X570-ACE has a T_Sensor header on board according to manual[1].
> 
> I'm using a 10kΩ B=3435K thermsistor attached to the header of WS X570-ACE.
> EC byte at 0x3d matches readings from BIOS sensor page and environment temperature.
> 
> [1]https://www.asus.com/Motherboards-Components/Motherboards/All-series/Pro-WS-X570-ACE/HelpDesk_Manual/
> 
> Signed-off-by: Wei Shuyu <wsy@dogben.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/asus-ec-sensors.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
> index b5cf0136360c..3ad8eadea68f 100644
> --- a/drivers/hwmon/asus-ec-sensors.c
> +++ b/drivers/hwmon/asus-ec-sensors.c
> @@ -178,7 +178,8 @@ static const struct dmi_system_id asus_ec_dmi_table[] __initconst = {
>  		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CHIPSET),
>  	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE, "Pro WS X570-ACE",
>  		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_VRM |
> -		SENSOR_FAN_CHIPSET | SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
> +		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CHIPSET |
> +		SENSOR_CURR_CPU | SENSOR_IN_CPU_CORE),
>  	DMI_EXACT_MATCH_BOARD(VENDOR_ASUS_UPPER_CASE,
>  			      "ROG CROSSHAIR VIII DARK HERO",
>  		SENSOR_SET_TEMP_CHIPSET_CPU_MB | SENSOR_TEMP_T_SENSOR |
