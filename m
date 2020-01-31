Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4274514F33D
	for <lists+linux-hwmon@lfdr.de>; Fri, 31 Jan 2020 21:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726262AbgAaUgk (ORCPT <rfc822;lists+linux-hwmon@lfdr.de>);
        Fri, 31 Jan 2020 15:36:40 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:24592 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726216AbgAaUgk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 31 Jan 2020 15:36:40 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=hexchain.org; q=dns/txt;
 s=smtp; t=1580502999; h=In-Reply-To: Content-Transfer-Encoding:
 Content-Type: MIME-Version: References: Message-ID: Subject: Cc: To:
 From: Date: Sender; bh=afKaD9dOWVfrE/hRj662AKeDwrx/dVxiDH2ziajw3QM=; b=IMIWLBzC1Yiu1lPf2zoVmcyZjvLtxA8c0I+2j/8+c2VUHGwvH24gFbe1b+JBWzq+lMu2Z+6f
 WAjRZHiK/OlTRh2MpMzO20RinEmsdvHLiWfWbbbP+wUgQZRBbec4cgNL/ycxJr4HgCdzd3eA
 dpwpuVke0GpsEQJFQbJNG7xERDS2YPt7Z8+hE87ekdmxFa3YrpQZVJZVwaelRHOtdYxtJZru
 aTYlNhRFgCin9+RP4UD9kfaGQJ+vZXweSd/8NT1K/7RfA8LwR2guDBDEpItJVXKQ1EGLqK0n
 OTL2Oul7pp89J7RdKONwPpskGlIsMJqpaN536UH9EL8N/QsLDBWaNw==
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJmM2VkYyIsICJsaW51eC1od21vbkB2Z2VyLmtlcm5lbC5vcmciLCAiMTkyNTE4Il0=
Received: from localhost (ip-80-113-22-187.ip.prioritytelecom.net [80.113.22.187])
 by mxa.mailgun.org with ESMTP id 5e348fd3.7fcc8cbaa690-smtp-out-n03;
 Fri, 31 Jan 2020 20:36:35 -0000 (UTC)
Date:   Fri, 31 Jan 2020 21:36:32 +0100
From:   Haochen Tong <i@hexchain.org>
To:     Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net
Subject: Re: [PATCH 1/2] dell-smm-hwmon: add XPS 13 9360 to supported devices
 list
Message-ID: <20200131203632.m7j4ndyab6ogxdgy@kotori.hexchain.org>
Mail-Followup-To: Haochen Tong <i@hexchain.org>,
        Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        linux-hwmon@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net
References: <20200129150839.122689-1-i@hexchain.org>
 <20200129150839.122689-2-i@hexchain.org>
 <20200130221011.kg3bwineutsdege7@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200130221011.kg3bwineutsdege7@pali>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jan 30, 2020 at 11:10:11PM +0100, Pali Rohár wrote:
> On Wednesday 29 January 2020 16:08:38 Haochen Tong wrote:
> > Tests have shown that this module works fine on XPS 13 9360: it can
> > successfully detect and report fan status.
> > 
> > Signed-off-by: Haochen Tong <i@hexchain.org>
> > ---
> >  drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> > index 17583bf8c2dc..d9f6394c08d6 100644
> > --- a/drivers/hwmon/dell-smm-hwmon.c
> > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > @@ -1104,6 +1104,13 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
> >  		},
> >  		.driver_data = (void *)&i8k_config_data[DELL_XPS],
> >  	},
> > +	{
> > +		.ident = "Dell XPS 13 9360",
> > +		.matches = {
> > +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> > +			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 13 9360"),
> 
> Hello! In patch 2/2 you are using DMI_EXACT_MATCH. I think it does not
> make sense to use substring match in one case and exact match in another
> case for one specific machine. I would suggest to use one type of match
> for both cases.
> 

Sure, will fix.
