Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E39439620E
	for <lists+linux-hwmon@lfdr.de>; Tue, 20 Aug 2019 16:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729992AbfHTOLt (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 20 Aug 2019 10:11:49 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:34014 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729762AbfHTOLs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 20 Aug 2019 10:11:48 -0400
Received: by mail-wm1-f43.google.com with SMTP id e8so2508885wme.1
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Aug 2019 07:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20150623.gappssmtp.com; s=20150623;
        h=sender:from:to:cc:subject:date:message-id;
        bh=LEqTLls42sbmI5VwKOm6X28Wqd3lNc1FuJ61+Mb/tX8=;
        b=Cs1pibJ1ZhNLrgABwvSomaLtVuOtZqECaToplmBgiSFFOyALHob2jmunT0LDP2rTLr
         8xjyBUqopE2eXJdn2ardKgcbFEUxhOAELFlaikQyhvbAgG0ucDYMGZ4iADMDMSqDU+0O
         3DrLOOguTT2aASkXqOvQzBmF3+MB8NoGMcF7sXLyiTh1vmNTV1OoUqjhx7oDQFt4yavz
         1jAjzjETMvmWHa8jVtdHXC4xHalXdqlJQA6HMI/uasX0tSY9v7Vv1XeXCA6Iq/FR837h
         oWZxhnY6V6D1G2GuQJr03LBCC0QDFpnpnYnoN5VfYqEAX02jmT6Ql+PoQjWi1c0x652o
         74Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=LEqTLls42sbmI5VwKOm6X28Wqd3lNc1FuJ61+Mb/tX8=;
        b=OjDzcL31MJ7rmIKud8VLcIbqQ2Awn52Kusab3KZLdzBSt05I7rBjva+A4l5fRT71/v
         5P0mdaoFyDnKbwCfgv48ewc9jj7PUxygV02fjSie/Lxm91otbJVk7Q5NDIipnckZRV5z
         97ne2G5191IE0eKT440mgcIcB1uEMGYmFtpx0tQXvecFSqFmiY08IVuy34mYPiPH+5jj
         Uf2Dti9H8skB+idXUyVz4uxhgqQa8rETCMgt+iPvyUJX6hGLHSkyxftLK282VzaayUyo
         HrOUzfHaTH56pQlbo7NL6nESXXTAWaiTLloX6RCrO3ekxuzrf1QNwlYQhUJ2t0Ew5vOM
         VHTg==
X-Gm-Message-State: APjAAAWgi10wmmBvmYO2MRMQS5Yh5A2QmnefzxK18n84yCnuAwBDkyUr
        Dx62l9fO8x7viogIJkblIkyXhg==
X-Google-Smtp-Source: APXvYqzNR58TVo7qQuCIjcdZQJaHL73fv9fbkxk4iC3wqq9XgsSdtNr1AIlJV9iaBdhgSN99G8bkHg==
X-Received: by 2002:a1c:cfc6:: with SMTP id f189mr240811wmg.18.1566310306618;
        Tue, 20 Aug 2019 07:11:46 -0700 (PDT)
Received: from localhost (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id r123sm185142wme.7.2019.08.20.07.11.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Aug 2019 07:11:45 -0700 (PDT)
From:   Michal Simek <michal.simek@xilinx.com>
To:     linux-kernel@vger.kernel.org, monstr@monstr.eu,
        michal.simek@xilinx.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>,
        linux-iio@vger.kernel.org,
        =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>,
        Rob Herring <robh+dt@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Jean Delvare <jdelvare@suse.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Hartmut Knaack <knaack.h@gmx.de>
Subject: [PATCH 0/4] iio: adc: ina2xx: Improve device identification
Date:   Tue, 20 Aug 2019 16:11:37 +0200
Message-Id: <cover.1566310292.git.michal.simek@xilinx.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

the purpose of this series is to improve ina226 identification. On systems
like Xilinx ZynqMP zcu102 (check dt in the tree) you can find out almost 20
ina226 chips and it is impossible to find out based on simple ina226 which
chip is repsonsible for what.
The series is adding two ways how to improve device identification.
Please let me know what you think I am happy to do changes in it.

Thanks,
Michal


Michal Simek (4):
  iio: adc: ina2xx: Define *device_node only once
  iio: adc: ina2xx: Setup better name then simple ina2xx
  dt-bindings: Add optional label property for ina2xx
  iio: adc: ina2xx: Use label proper for device identification

 .../devicetree/bindings/hwmon/ina2xx.txt          |  2 ++
 drivers/iio/adc/ina2xx-adc.c                      | 15 +++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.17.1

