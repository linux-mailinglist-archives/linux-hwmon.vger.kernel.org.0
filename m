Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 390A21ADA7C
	for <lists+linux-hwmon@lfdr.de>; Fri, 17 Apr 2020 11:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgDQJzG (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 17 Apr 2020 05:55:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:42384 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726366AbgDQJzG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Apr 2020 05:55:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 8079EACD0;
        Fri, 17 Apr 2020 09:55:04 +0000 (UTC)
Date:   Fri, 17 Apr 2020 11:55:03 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (jc42) Fix name to have no illegal characters
Message-ID: <20200417115503.249d4d48@endymion>
In-Reply-To: <20200417092853.31206-1-s.hauer@pengutronix.de>
References: <20200417092853.31206-1-s.hauer@pengutronix.de>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Sascha,

On Fri, 17 Apr 2020 11:28:53 +0200, Sascha Hauer wrote:
> The jc42 driver passes I2C client's name as hwmon device name. In case
> of device tree probed devices this ends up being part of the compatible
> string, "jc-42.4-temp". This name contains hyphens and the hwmon core
> doesn't like this:
> 
> jc42 2-0018: hwmon: 'jc-42.4-temp' is not a valid name attribute, please fix
> 
> This changes the name to "jc42" which doesn't have any illegal
> characters.

I don't think "jc-42.4-temp" is a valid i2c client name either. I
believe this should be fixed at the of->i2c level, rather than the
i2c->hwmon level. Not sure how other drivers are dealing with that, it
seems that in most cases the name part of the compatible string matches
exactly the expected client name so no conversion is needed.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
