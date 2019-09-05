Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B822A9805
	for <lists+linux-hwmon@lfdr.de>; Thu,  5 Sep 2019 03:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727562AbfIEBbE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-hwmon@lfdr.de>); Wed, 4 Sep 2019 21:31:04 -0400
Received: from sender4-op-o14.zoho.com ([136.143.188.14]:17489 "EHLO
        sender4-op-o14.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727156AbfIEBbE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Sep 2019 21:31:04 -0400
X-Greylist: delayed 904 seconds by postgrey-1.27 at vger.kernel.org; Wed, 04 Sep 2019 21:31:03 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1567646140; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=GTRSVCb9IQAlTIq9hEJ3Qxph36Kq4sdMHGTDR4xVYrMxTLjzlfyR7B7MkCB9vLEbMGTuLCrCjPUAt5yl75nATMjGaIwow8/w2dUgbLcEc1jvjg0l51IauEVErOk9UCPVWTJ5g4+p6VKkAFQNcBPUON11+mXVk56CVwq7UMiuETg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1567646140; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To:ARC-Authentication-Results; 
        bh=9eX5Xl58jLKN3TtsAgx+hKqvwqAPKtjVLQ00V5GDybI=; 
        b=FpOaD5Mko+ztHy2BQyPIZ3PnYQWfEMKQsVsqSp5lgh+IFH+urJ143ZODrLdmZ5Bozlbll01VOBuyJSqKfUbeVrbJSLaEdFrQiH5DjT327NiJJPIsup6N/H843aW7rG51hvoKX1c0ior5sNoNtmcarsGVtI625u/InH7CI8lAxOw=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=dlrobertson.com;
        spf=pass  smtp.mailfrom=dan@dlrobertson.com;
        dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from nessie.verizon.net (pool-100-15-144-194.washdc.fios.verizon.net [100.15.144.194]) by mx.zohomail.com
        with SMTPS id 1567646138202616.034923338814; Wed, 4 Sep 2019 18:15:38 -0700 (PDT)
From:   Dan Robertson <dan@dlrobertson.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dan Robertson <dan@dlrobertson.com>
Message-ID: <20190905010130.15019-1-dan@dlrobertson.com>
Subject: [PATCH 0/1] hwmon: (shtc1) add support for the SHTC3 sensor
Date:   Thu,  5 Sep 2019 01:01:29 +0000
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

I added support for the Sensirion SHTC3 temperature and humidity sensor
to the shtc1 module and added the relevant documentation.

Cheers,

Dan

Dan Robertson (1):
  hwmon: (shtc1) add support for the SHTC3 sensor

 Documentation/hwmon/shtc1.rst | 19 +++++++++----
 drivers/hwmon/Kconfig         |  4 +--
 drivers/hwmon/shtc1.c         | 50 ++++++++++++++++++++++++++---------
 3 files changed, 53 insertions(+), 20 deletions(-)

-- 
2.23.0



