Return-Path: <linux-hwmon+bounces-15484-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lRGVLvWPQ2oZcAoAu9opvQ
	(envelope-from <linux-hwmon+bounces-15484-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 11:44:21 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 007446E25F0
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 11:44:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=h-partners.com header.s=dkim header.b=YeIU34cd;
	spf=pass (mail.lfdr.de: domain of "linux-hwmon+bounces-15484-lists+linux-hwmon=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-hwmon+bounces-15484-lists+linux-hwmon=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=huawei.com (policy=quarantine);
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B84073021BE5
	for <lists+linux-hwmon@lfdr.de>; Tue, 30 Jun 2026 09:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F453F1676;
	Tue, 30 Jun 2026 09:25:35 +0000 (UTC)
X-Original-To: linux-hwmon@vger.kernel.org
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B0D3ECBCF;
	Tue, 30 Jun 2026 09:25:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811535; cv=none; b=kxdVuqHWidTEUqp6OrljTSs1lp3cYdxfrQVCApemb4lOG9VJ5VssOk+OMVdQOfa6CV/Ky9gUXfUHzvoPBN6vVV20/waOkcWJnYsaM6a9MHK+GGx3/jjY4Ps3C85twYVPjcVEAICsZb6g8AeBQYz+i8U3Qiyms6cVgkruGi88fOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811535; c=relaxed/simple;
	bh=BvvdzDIbReIs5HbH5VnfSbeJYSYBz9KdmQd2QK47Lqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MlOp4MJu0V/mnHoYdm0jMYvgmE2HUZwnhTRU5ShPWSlelvIVrtTj4gjCAP204nxyQcOpekV9tQO/2+x0i3dbLJ0tm4BUAAEo6xcM2R4MWqfmEP8GTuRgcEr80yKE4KPX9t1WNABHI0H0wzfRGAdGhJ9o3M0NgfHb8PPDy9IFGIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=h-partners.com; dkim=pass (1024-bit key) header.d=h-partners.com header.i=@h-partners.com header.b=YeIU34cd; arc=none smtp.client-ip=113.46.200.220
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ypNRSPdJ2bARCvejwrrOJdIbBu4o83I85Gb2mRZroKo=;
	b=YeIU34cdd+d07UG42qD3FZ9z/XDy8KygM3AidpVXAczClOmA6xUgg/l2dSibiIzaqxhU9GhFm
	PPJy3RCFL+93OQtskIbAOocjmCh6DzQ+DLnFxUPtrztInKjQU/UAjWvY1dmeHegOyca04149aQB
	2iM0EdGo4x7WqCCfXVz+eeU=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gqHZt3FYFz12LF6;
	Tue, 30 Jun 2026 17:16:38 +0800 (CST)
Received: from kwepemo100005.china.huawei.com (unknown [7.202.195.212])
	by mail.maildlp.com (Postfix) with ESMTPS id 2FDFB4057F;
	Tue, 30 Jun 2026 17:25:22 +0800 (CST)
Received: from [10.67.121.59] (10.67.121.59) by kwepemo100005.china.huawei.com
 (7.202.195.212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 30 Jun
 2026 17:25:21 +0800
Message-ID: <10fb88e6-02f8-46b8-9665-db94a4035c5d@huawei.com>
Date: Tue, 30 Jun 2026 17:25:20 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ACPI/PCC: Preserve platform-populated PCC signatures
To: Sudeep Holla <sudeep.holla@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Jassi Brar
	<jassisinghbrar@gmail.com>, Guenter Roeck <linux@roeck-us.net>,
	<linux-hwmon@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	<linux-i2c@vger.kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, <linux-pm@vger.kernel.org>, <lihuisong@huawei.com>
References: <20260627-acpi_pcc_signature-v1-0-c1b7268d4fdc@kernel.org>
From: "lihuisong (C)" <lihuisong@huawei.com>
In-Reply-To: <20260627-acpi_pcc_signature-v1-0-c1b7268d4fdc@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemo100005.china.huawei.com (7.202.195.212)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[huawei.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[h-partners.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15484-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:linux-acpi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rafael@kernel.org,m:jassisinghbrar@gmail.com,m:linux@roeck-us.net,m:linux-hwmon@vger.kernel.org,m:andi.shyti@kernel.org,m:linux-i2c@vger.kernel.org,m:myungjoo.ham@samsung.com,m:kyungmin.park@samsung.com,m:cw00.choi@samsung.com,m:linux-pm@vger.kernel.org,m:lihuisong@huawei.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[lihuisong@huawei.com,linux-hwmon@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,roeck-us.net,vger.kernel.org,samsung.com,huawei.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[h-partners.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lihuisong@huawei.com,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[h-partners.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,huawei.com:mid,huawei.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 007446E25F0

Hi Sudeep,

On 6/28/2026 12:37 AM, Sudeep Holla wrote:
> ACPI PCC shared memory layouts reserve the first dword for the PCC
> signature. ACPI specification defines the signature as 0x50434300 ORed
> with the PCC subspace ID, and ACPI 6.6 clarify that the signature is
> populated by the platform and verified by OSPM.
>
> This series centralizes PCC shared memory signature validation in the PCC
> mailbox controller and stops PCC users from rewriting the signature before
> each command. Clients that previously copied complete local PCC headers
> now update only the mutable command/status/flags/length/payload fields.
I am concerned that this may affect the functionality of drivers on some 
existed platforms.
This largely depends on the implementation of the platform firmware.

I think it's good for the signature to be filled in by the command 
initiator and then verified
by the recipient, as this is how this field can serve its purpose.
Otherwise, I really don't see what use it has.

/Huisong
>
> The final patch also fixes the PCC OperationRegion handler. ACPI defines
> a PCC OperationRegion as the shared memory fields that follow the PCC
> signature, with the OperationRegion length covering only those fields. The
> handler is updated to copy to/from the region after the signature and to
> reject regions that do not fit there.
>
> All patches can go independently as there is no strict dependency between
> them and posted together for the complete context.
>
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
> Sudeep Holla (6):
>        mailbox: pcc: Validate shared memory signature on request
>        hwmon: xgene: Stop writing PCC shared memory signature
>        i2c: xgene-slimpro: Stop writing PCC shared memory signature
>        devfreq: hisi_uncore: Preserve PCC shared memory signature
>        soc: hisilicon: kunpeng_hccs: Preserve PCC signatures
>        ACPI: PCC: Preserve shared memory signature in OpRegion handler
>
>   drivers/acpi/acpi_pcc.c                | 20 ++++++++++++++----
>   drivers/devfreq/hisi_uncore_freq.c     | 15 +++++++-------
>   drivers/hwmon/xgene-hwmon.c            |  4 ----
>   drivers/i2c/busses/i2c-xgene-slimpro.c |  3 ---
>   drivers/mailbox/pcc.c                  | 38 +++++++++++++++++++++++++++++-----
>   drivers/soc/hisilicon/kunpeng_hccs.c   | 24 ++++++++-------------
>   6 files changed, 65 insertions(+), 39 deletions(-)
> ---
> base-commit: 5a66900afbd6b2a063eebad35294038a654de2b0
> change-id: 20260627-acpi_pcc_signature-7b70b0633c8f
>
>

