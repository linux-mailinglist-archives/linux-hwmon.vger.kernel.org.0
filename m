Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1091B4D28
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2020 21:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgDVTPf (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 22 Apr 2020 15:15:35 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:38422 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbgDVTPf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Apr 2020 15:15:35 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 748D8120ED578;
        Wed, 22 Apr 2020 12:15:34 -0700 (PDT)
Date:   Wed, 22 Apr 2020 12:15:33 -0700 (PDT)
Message-Id: <20200422.121533.1226447215385048583.davem@davemloft.net>
To:     michael@walle.cc
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk
Subject: Re: [PATCH net-next v3 3/3] net: phy: bcm54140: add hwmon support
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200420182113.22577-3-michael@walle.cc>
References: <20200420182113.22577-1-michael@walle.cc>
        <20200420182113.22577-3-michael@walle.cc>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 22 Apr 2020 12:15:34 -0700 (PDT)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Walle <michael@walle.cc>
Date: Mon, 20 Apr 2020 20:21:13 +0200

> The PHY supports monitoring its die temperature as well as two analog
> voltages. Add support for it.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Applied.
