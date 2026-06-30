Return-Path: <linux-hwmon+bounces-15502-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id edmaKb3sQ2qUlgoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15502-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 18:20:13 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F04756E65FC
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 18:20:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=TzoRfypq;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15502-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15502-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF64C3014541
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 16:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E962477993;
	Tue, 30 Jun 2026 16:15:11 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE4847277C;
	Tue, 30 Jun 2026 16:15:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782836110; cv=none; b=oWdfM1cdKpZnJ0yBJJZ2rSwkRWULRazRM2V/fP9HuYSsGd+EMMh2Oh41ZalDuVYg0m/WCPweHrwjtKE8BciRXZDFGoxXx+t1v/VG82yFnJpCrkPsvexQRhB4dfcrFVstiaC0955my05jhKBQ7MwnKj65VdsTNKeoX1Z8WR4U7EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782836110; c=relaxed/simple;
	bh=CXaeKMIRSrvYxU3iiMGwtvb8iGGkSv/3XmNw9Vnfn1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C39j3DGgVOcsLTdl5GVbt4swzc1zBbocmskULYefWhLIYrBfhpmETYO4AEtTa53RpE1NhPvOmc4IKbPWBdGWLk+fuw2Wa78BwHRdKSrapp4FIAzfbzYPWpff7MRjzkgd1iv6Jvgu0fUeFtAhCP0xEiAcDBS+xWuRR723rkSfLaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TzoRfypq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7359C1F000E9;
	Tue, 30 Jun 2026 16:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782836108;
	bh=eb0sWdkKcVZuiKOIJ6FAW+I06k/4BEXqFcAMn2RFR64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TzoRfypqbyHyYC058os6xjzoo0pe/kS/QOQH02nFIqoXQhsi9obHZ/eurkAXX77r/
	 TGf6F7sl95t4bcLwI2dS9DburRMXdJ6ZnW0VjmesOruwSWIXEhSJX0USX4j/PtCLoR
	 k04vJGCUaRCwFfGQ6kUFPmlMxNfaYbvPhWrSu1NTuy2xFeZsUYxAlotm+yPIXBJbx8
	 Zk7A7wZtD+EH7DCLZE7Owkf678LTcUSvtc+vY8+KLX404Qi1c9/1qSFwbV9JRtjHha
	 chnvRadTMlmO/S/1hM02JYqktsTBI/E52jNgMQ1ZEsoE/woKA2wd0NFAsGOloeaNFt
	 kcJC3NxCEdOfA==
Date: Tue, 30 Jun 2026 11:15:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-tegra@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 01/12] dt-bindings: i3c: Add mipi-i3c-static-method to
 support SETAASA
Message-ID: <178283610732.3797495.11836462917948472551.robh@kernel.org>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-2-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624102153.1770072-2-akhilrajeev@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15502-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilrajeev@nvidia.com,m:miquel.raynal@bootlin.com,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:alexandre.belloni@bootlin.com,m:linux@roeck-us.net,m:linux-tegra@vger.kernel.org,m:linux-i3c@lists.infradead.org,m:p.zabel@pengutronix.de,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-hwmon@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F04756E65FC


On Wed, 24 Jun 2026 10:20:55 +0000, Akhil R wrote:
> Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> Discovery and Configuration Specification [1] to specify which discovery
> method an I3C device supports during bus initialization. The property is
> a bitmap, where a bit value of 1 indicates support for that method, and 0
> indicates lack of support.
> 
> Bit 0: SETDASA CCC (Direct)
> Bit 1: SETAASA CCC (Broadcast)
> Bit 2: Other CCC (vendor / standards extension)
> All other bits are reserved.
> 
> It is specifically needed when an I3C device requires SETAASA for the
> address assignment. SETDASA will be supported by default if this property
> is absent, which means for now the property just serves as a flag to
> enable SETAASA, but keep the property as a bitmap to align with the
> specifications.
> 
> [1] https://www.mipi.org/mipi-disco-for-i3c-download
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  .../devicetree/bindings/i3c/i3c.yaml          | 36 ++++++++++++++++---
>  include/dt-bindings/i3c/i3c.h                 |  4 +++
>  2 files changed, 35 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


