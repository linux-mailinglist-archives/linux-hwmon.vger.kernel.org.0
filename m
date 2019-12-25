Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8E112A598
	for <lists+linux-hwmon@lfdr.de>; Wed, 25 Dec 2019 03:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfLYCdp (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Tue, 24 Dec 2019 21:33:45 -0500
Received: from mx.treblig.org ([46.43.15.161]:57984 "EHLO mx.treblig.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726258AbfLYCdp (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Dec 2019 21:33:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
        ; s=bytemarkmx; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UFz2XkdZV5bVwgMu1CKwwWwmkAo1s5/NL8ni9gIyQEM=; b=ivZGulpUSMZ9bFEy28TxK5+pDa
        7nc/IKcqd/1fb6UlOwad3AxZrpLYHj/Nol10/foP8PSR+eQY/f8akcMyX1foV10v/yfPoHUV4NAEZ
        vaFKQmg1cTiYJNqbNGAJ4RQ/Aq92Cn4sanEWlFigqSvHrR5iojmgFYPWRUWD9lpspFjYx/fZd+MLp
        TFGp2tL1vRsTea5MoC7Vc8u7PDw5iuxNPi4hwdDrJ54ggni0q4FXT671DuAGRCUxy1XUPU7UVscoT
        FSvsId7gFaU46GGvwefxdOrZXSZQ+w6JyQM/wEtDIDwHXDsv1whvAGy2De5om+Bdam6Jwtu8FmIF0
        O1K0u73g==;
Received: from localhost ([127.0.0.1] helo=major.home.treblig.org)
        by mx.treblig.org with esmtp (Exim 4.92)
        (envelope-from <linux@treblig.org>)
        id 1ijwUV-0000lw-GV; Wed, 25 Dec 2019 02:33:39 +0000
From:   "Dr. David Alan Gilbert" <linux@treblig.org>
To:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Cc:     "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/3] hwmon: (w83627ehf) remove nct6775 and nct6776 support
Date:   Wed, 25 Dec 2019 02:32:22 +0000
Message-Id: <20191225023225.2785-1-linux@treblig.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Guenter pointed out that we should remove the nct677[56] from
w83627ehf since there's a separate nct6775.c driver.

It removes a quite satisfying amount of code.

Built ontop of hwmon-next 848a25f01ee.

Dave

Dr. David Alan Gilbert (3):
  hwmon: (w83627ehf) remove nct6775 and nct6776 support
  hwmon: (w83627ehf) Remove code not needed after nct677* removal
  hwmon: (w83627ehf) Now only one intrusion channel

 drivers/hwmon/Kconfig     |   5 +-
 drivers/hwmon/w83627ehf.c | 624 +++++---------------------------------
 2 files changed, 74 insertions(+), 555 deletions(-)

-- 
2.24.1

