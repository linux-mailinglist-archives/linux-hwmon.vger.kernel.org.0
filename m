Return-Path: <linux-hwmon+bounces-14288-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKjvKSd5C2qRIAUAu9opvQ
	(envelope-from <linux-hwmon+bounces-14288-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 22:40:07 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 098385737AF
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 22:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 746A5301E6D6
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 20:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0012E392C5A;
	Mon, 18 May 2026 20:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuuHcR+1"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F2D377ED9
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 20:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779136533; cv=none; b=ieXLotSN6zuMhWwqI9ssJpKF15HvjWXcn9n06q0eSubLucgIks4QAPWM0kzMbtL3FHS67c+hXG2V2KjoJbO9doR092x8FSPaCsusk4kKwzvo8+NQvkIxFNRkE+AaKNj0O2p3uLy3j9ooip70380fWtNYjuT6G4TcWACPTW5pzuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779136533; c=relaxed/simple;
	bh=lk9vjzREjZwJFtFO1d0P1hxRCNkjB4I8h1l3wgdg6X8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LBRfqIxByg37oseAUwE6YEsxHws78pZ+bKPn9RWgF33BeptEAOT+olshUxx82Q/Akpxw/Vv2oNyUgM5dZXIDcxszoK2W3U47H35a8DmgK8ANCIvT+aBBiaLRmlI47JpZ6gMQNxIhGFoVtLzzkHmrd+L1iTyEpM+qAYODl8+gif0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuuHcR+1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E46C2BCB7;
	Mon, 18 May 2026 20:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779136533;
	bh=lk9vjzREjZwJFtFO1d0P1hxRCNkjB4I8h1l3wgdg6X8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=VuuHcR+1Ff2UKwmYOokNiJzd/2cLwggKEGPy/aoA1nkTa7kP+zPF+GR2gIygAaJuY
	 hel3KJEBwW1iMsG2GG9s4J1Q3//VsyUyd5lU2NbGJwqv60reT7g46GApxY7GExr5rG
	 gXWrd2QrIUooVuQt2nmV9lyTb6HBLCqIy5Ny4S3Bu+7/Zzb1W4vL60lHAlIvQvSHT3
	 9WdJTAfvMjTb3CszCaqGf8BdCayIK/VDbDDLUYTYLItrVWxAvD2WWMBa+WdLMrPb6z
	 ZAcEurFoDTU78vAeVKOCBVJOEAjB+9ILK9Q7NKV0++GySJ7753UuzY1kAseuysH+Yu
	 Q3uqdLI4WCRYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adam Young" <admiyo@os.amperecomputing.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 20:35:32 +0000
Message-Id: <20260518203533.56E46C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-14288-lists,linux-hwmon=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-hwmon@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lists.linux.dev:replyto,sashiko.dev:url,smtp.kernel.org:mid]
X-Rspamd-Queue-Id: 098385737AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Clients relying on `rx_callback` for completion will timeout on er=
ror because `mbox_chan_received_data` is skipped.
- [High] Slave subspace (Type 4) messages from the platform are silently dr=
opped and acknowledged on error.
- [Medium] Positive ACPI status codes are leaked into the mailbox framework=
 as error codes.
--

commit 02ebdabd8b273de3b908d80f12b3a4d373284736
Author: Adam Young <admiyo@os.amperecomputing.com>

mailbox: pcc: report errors for PCC clients

The commit modifies the PCC mailbox IRQ handler to read the error status
and pass it to the tx_done callback. It also skips the receive callback if
an error occurred.

> diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> index 636879ae1db76..16b9ce087b9ec 100644
> --- a/drivers/mailbox/pcc.c
> +++ b/drivers/mailbox/pcc.c
[ ... ]
> @@ -327,8 +328,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>  	if (!pcc_mbox_cmd_complete_check(pchan))
>  		return IRQ_NONE;
> =20
> -	if (pcc_mbox_error_check_and_clear(pchan))
> -		return IRQ_NONE;
> +	rc =3D pcc_mbox_error_check_and_clear(pchan);

Can pcc_mbox_error_check_and_clear() return a positive acpi_status value
(like AE_ERROR) if pcc_chan_reg_read() fails?

If so, this positive value would be passed to mbox_chan_txdone(), which
might cause issues for clients that check if the returned error is less
than zero.

> =20
>  	/*
>  	 * Clear this flag after updating interrupt ack register and just
> @@ -337,8 +337,9 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
>  	 * required to avoid any possible race in updatation of this flag.
>  	 */
>  	pchan->chan_in_use =3D false;
> -	mbox_chan_received_data(chan, NULL);
> -	mbox_chan_txdone(chan, 0);
> +	if (!rc)
> +		mbox_chan_received_data(chan, NULL);

Since clients like drivers/acpi/cppc_acpi.c and
drivers/soc/hisilicon/kunpeng_hccs.c rely on rx_callback (invoked by
mbox_chan_received_data()) to signal their completions, will skipping it
here cause them to block until their timeout expires instead of processing
the error?

For ACPI_PCCT_TYPE_EXT_PCC_SLAVE_SUBSPACE channels used by the platform to
send notifications to the OS, does skipping mbox_chan_received_data() cause
the OS to silently drop the platform's notification?

> +	mbox_chan_txdone(chan, rc);
> =20
>  	pcc_chan_acknowledge(pchan);

If a slave subspace notification is dropped due to an error, does calling
pcc_chan_acknowledge() falsely indicate to the platform that the
notification was successfully handled?

>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518193006.2742=
5-1-admiyo@os.amperecomputing.com?part=3D1

