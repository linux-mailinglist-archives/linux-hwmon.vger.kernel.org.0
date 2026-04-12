Return-Path: <linux-hwmon+bounces-13263-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BCLLwP+22luKgkAu9opvQ
	(envelope-from <linux-hwmon+bounces-13263-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Apr 2026 22:18:11 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A02C3E5D9B
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Apr 2026 22:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C07C23003620
	for <lists+linux-hwmon@lfdr.de>; Sun, 12 Apr 2026 20:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809E437F72E;
	Sun, 12 Apr 2026 20:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nWTfwe/l"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C3937E30D;
	Sun, 12 Apr 2026 20:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776025089; cv=none; b=sKH2b3Kd++ChPKWQ8ydh967zkOej29NpV5qL/JvaCQqfR/U8U7r0k6BnHpJRbVlpOW6khe4RO1wVsYaqV+OlbCE99KRJr612pG+TjyvWE4Xeg4Do4qMMaaQksZxA4emVbjWePILY+TjFRLTudVUZDuxv2mlj6uEGm3guSkKUn8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776025089; c=relaxed/simple;
	bh=iGGMa7Z7yKs8PCJqrveaurxhweXuFiwoOym7d8SEypk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J07V50W7ylIatcqYXlk+ykteo3A0ydhevb3RCoWZJVhAlDUF2deTxJ5+1ynD4XE+Kk3OCos7zPzxUmJOYOWeJtFRRn9YICCrsPLmi7oeHePyqsaUJWWjDuaUY51H/3Niy8ZV2ewaTB+bx1wltlV6TvmWI1HQvvbIWsXtDR/d3+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nWTfwe/l; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BB4B81A3220;
	Sun, 12 Apr 2026 20:18:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CCA95FFB9;
	Sun, 12 Apr 2026 20:18:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69A491045012A;
	Sun, 12 Apr 2026 22:18:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776025085; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=AQaMeJLQws+JogYQcF2TyPERMpXvW6pBtPclJ0LsSvg=;
	b=nWTfwe/lLJQQ6aRVz/kxIj6bZJJgaW2Tuk9pYyyhrgEiL4OZeS/nNw22FgTszcsTwLkWZR
	ruvn3IgA/0OD6kkUq4o0Z/yvNVGSgbysCeiR9B4WRBB/b0CFRqbwPnZNcBhuwF8WInCTTj
	eGFNsloh8SG6OHPgXLS/igSoNhfIaJN92GOVuBySinHMuB/I75fFysrYzlf+lZSSzeLtdj
	QKRcP8RZJ8wlh/hO4u74n8ALgCAe2tBEdhw3CzqdnXO/KJR9zI5TrBgPIVNP0hmAueCtgs
	IFaX+UHS001PdC+pnzTsdYJMFeIIl94WoRJu7bcBJnVE3UGJZcyT1ROI/IoebA==
Date: Sun, 12 Apr 2026 22:18:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: frank.li@nxp.com, acpica-devel@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org, ebiggers@kernel.org, krzk+dt@kernel.org,
	lenb@kernel.org, linux-acpi@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@roeck-us.net,
	miquel.raynal@bootlin.com, p.zabel@pengutronix.de,
	rafael@kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com,
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v2 04/13] i3c: master: Support ACPI enumeration of child
 devices
Message-ID: <202604122018012539fc7c@mail.local>
References: <adhdsn6u4RAIL9wC@lizhi-Precision-Tower-5810>
 <20260410053147.27344-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410053147.27344-1-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13263-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:email,bootlin.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nvidia.com:email,mail.local:mid]
X-Rspamd-Queue-Id: 6A02C3E5D9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10/04/2026 11:01:47+0530, Akhil R wrote:
> On Thu, 9 Apr 2026 22:17:22 -0400, Frank Li wrote:
> > On Thu, Apr 09, 2026 at 04:27:34PM +0530, Akhil R wrote:
> >> Although the existing subsystem allows host controllers to register
> >> through the ACPI table, it was not possible to describe I3C or I2C
> >> devices when using ACPI. This is because the driver relied on reg
> >> property to retrieve the PID, static address etc whereas ACPI uses
> >> _ADR or serial resources to describe such devices.
> >>
> >> Read _ADR and LVR from the ACPI resources and extract the data as per the
> >> ACPI specification for an I3C bus. Also read mipi-i3c-static-address as
> >> per the MIPI DISCO specifications [1] to get the static address to be
> >> used. Hence enable describing the I3C or I2C devices in the ACPI
> >> table, which is required if the device is using a static address or if it
> >> needs some specific properties to be attached to it.
> > 
> > Please wrap your commit message at 75 char.
> 
> Ack. Will do.
> 
> > 
> >>
> >> [1] https://www.mipi.org/mipi-disco-for-i3c-download
> >>
> >> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> >> ---
> >>  drivers/i3c/master.c | 140 ++++++++++++++++++++++++++++++++++++++++---
> >>  1 file changed, 132 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> >> index 5e0e926f61f3..08d0fcabd6f1 100644
> >> --- a/drivers/i3c/master.c
> >> +++ b/drivers/i3c/master.c
> >> @@ -5,6 +5,7 @@
> >>   * Author: Boris Brezillon <boris.brezillon@bootlin.com>
> >>   */
> >>
> >> +#include <linux/acpi.h>
> >>  #include <linux/atomic.h>
> >>  #include <linux/bug.h>
> >>  #include <linux/device.h>
> >> @@ -2403,6 +2404,53 @@ EXPORT_SYMBOL_GPL(i3c_master_add_i3c_dev_locked);
> >>
> >>  #define OF_I3C_REG1_IS_I2C_DEV			BIT(31)
> >>
> >> +#ifdef CONFIG_ACPI
> > ...
> > 
> >> +#ifdef CONFIG_ACPI
> >> +static int i3c_master_add_acpi_dev(struct i3c_master_controller *master,
> >> +				   struct fwnode_handle *fwnode)
> > 
> > 
> > Can you move this and below function to previous #ifdef CONFIG_ACPI block.
> 
> Ack. I will update, but there are some cross-dependencies. We may have to
> add a few function prototypes with the headers if we have to move these
> under the same block. Hope that is fine.
> 

If you have cross-dependencies, then I guess they can sty separate
blocks.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

