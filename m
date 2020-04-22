Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433011B4D22
	for <lists+linux-hwmon@lfdr.de>; Wed, 22 Apr 2020 21:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbgDVTPY (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Wed, 22 Apr 2020 15:15:24 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:38384 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbgDVTPY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Apr 2020 15:15:24 -0400
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 1F7A2120ED563;
        Wed, 22 Apr 2020 12:15:22 -0700 (PDT)
Date:   Wed, 22 Apr 2020 12:15:18 -0700 (PDT)
Message-Id: <20200422.121518.848008082657109214.davem@davemloft.net>
To:     michael@walle.cc
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk
Subject: Re: [PATCH net-next v3 1/3] net: phy: broadcom: add helper to
 write/read RDB registers
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200420182113.22577-1-michael@walle.cc>
References: <20200420182113.22577-1-michael@walle.cc>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Wed, 22 Apr 2020 12:15:22 -0700 (PDT)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Michael Walle <michael@walle.cc>
Date: Mon, 20 Apr 2020 20:21:11 +0200

> RDB (Register Data Base) registers are used on newer Broadcom PHYs. Add
> helper to read, write and modify these registers.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>

Applied.
