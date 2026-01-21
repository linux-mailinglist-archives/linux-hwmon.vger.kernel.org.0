Return-Path: <linux-hwmon+bounces-11360-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJmZLZqUcGlyYgAAu9opvQ
	(envelope-from <linux-hwmon+bounces-11360-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Jan 2026 09:55:54 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7770153EE8
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Jan 2026 09:55:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 538E13A6881
	for <lists+linux-hwmon@lfdr.de>; Wed, 21 Jan 2026 08:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9430F421EEC;
	Wed, 21 Jan 2026 08:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VI3iJdv/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PjBMP4i7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VI3iJdv/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PjBMP4i7"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBD3299AA3
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Jan 2026 08:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985634; cv=none; b=BTnQj+MR1WgkLj/97tWd10rHoS25AvPK5loWQi30OvmRm4++MQT+slRQOlKXwPK0MFidVOBqOMtgmWsO07fer8QYT1pNlckkHdHe00kC0UNZGHlS91qplVziqSDUrtA7SiTDUB99i6O7tjHON1cfY1QPHuD4Cx7A9KtYpDf61MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985634; c=relaxed/simple;
	bh=nq32qtmt5DIl5GZ7n99NefQrUyB8pxSmKtOorBJg4ew=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bdSmhkIa+oyetmoks/Ed0uu1RASTgEggJ4EvKOwhplkoucn+T+l4r/vdHnQR6xsSXFIzjUGKoB9DkQlY8Hg+/swxAeFfQGMpwNKeuWqXRQ7e5ngKlq2fnnLYBN+dOehf9CsXEfyskWq3fpgKkr1G6oALSMLv39LOvx6mOEgN7vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VI3iJdv/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PjBMP4i7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VI3iJdv/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PjBMP4i7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 615815BCCE;
	Wed, 21 Jan 2026 08:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768985625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCAEgI1NXZICV5FesEeTCEbgaf4gL38GRWFQhZQwH24=;
	b=VI3iJdv/Ao5+RLDXtKyS037Qsx1oLqhZRUPddpCC3MjrjqQsXcrU/4UBqZah3rI8aLahy5
	eW+kYSqZvvSlUHUN030smK9Yz6tX14EAQZ5y/nqi7UJNiDGzp9KeSHoKo2A3+CcqTGCaOh
	2pxnFHYjX82h80MjXPinyLrTvfCTzXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768985625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCAEgI1NXZICV5FesEeTCEbgaf4gL38GRWFQhZQwH24=;
	b=PjBMP4i7myo3f99psJ2b4yNrKOlpRjMBT54cyY+CvzaSIYYrLkHfsCd9xmjIe4NZClVJp3
	L9cJ8Vc4Uq44DSCA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="VI3iJdv/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PjBMP4i7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1768985625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCAEgI1NXZICV5FesEeTCEbgaf4gL38GRWFQhZQwH24=;
	b=VI3iJdv/Ao5+RLDXtKyS037Qsx1oLqhZRUPddpCC3MjrjqQsXcrU/4UBqZah3rI8aLahy5
	eW+kYSqZvvSlUHUN030smK9Yz6tX14EAQZ5y/nqi7UJNiDGzp9KeSHoKo2A3+CcqTGCaOh
	2pxnFHYjX82h80MjXPinyLrTvfCTzXY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1768985625;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cCAEgI1NXZICV5FesEeTCEbgaf4gL38GRWFQhZQwH24=;
	b=PjBMP4i7myo3f99psJ2b4yNrKOlpRjMBT54cyY+CvzaSIYYrLkHfsCd9xmjIe4NZClVJp3
	L9cJ8Vc4Uq44DSCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 34A073EA63;
	Wed, 21 Jan 2026 08:53:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jGHWChmUcGlDFwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Wed, 21 Jan 2026 08:53:45 +0000
Date: Wed, 21 Jan 2026 09:53:42 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Junrui Luo <moonafterrain@outlook.com>
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (ibmpex) fix use-after-free in high/low store
Message-ID: <20260121095342.73e723cb@endymion>
In-Reply-To: <MEYPR01MB7886BE2F51BFE41875B74B60AFA0A()MEYPR01MB7886!ausprd01!prod!outlook!com>
References: <MEYPR01MB7886BE2F51BFE41875B74B60AFA0A()MEYPR01MB7886!ausprd01!prod!outlook!com>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.01
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11360-lists,linux-hwmon=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[suse.de,none];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jdelvare@suse.de,linux-hwmon@vger.kernel.org];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,outlook.com:email]
X-Rspamd-Queue-Id: 7770153EE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Junrui, Guenter,

On Wed, 10 Dec 2025 09:48:08 +0000, Junrui Luo wrote:
> The ibmpex_high_low_store() function retrieves driver data using
> dev_get_drvdata() and uses it without validation. This creates a race
> condition where the sysfs callback can be invoked after the data
> structure is freed, leading to use-after-free.
> 
> Fix by adding a NULL check after dev_get_drvdata(), and reordering
> operations in the deletion path to prevent TOCTOU.
> 
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Reported-by: Junrui Luo <moonafterrain@outlook.com>
> Fixes: 57c7c3a0fdea ("hwmon: IBM power meter driver")
> Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
> ---
>  drivers/hwmon/ibmpex.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
> index 228c5f6c6f38..129f3a9e8fe9 100644
> --- a/drivers/hwmon/ibmpex.c
> +++ b/drivers/hwmon/ibmpex.c
> @@ -277,6 +277,9 @@ static ssize_t ibmpex_high_low_store(struct device *dev,
>  {
>  	struct ibmpex_bmc_data *data = dev_get_drvdata(dev);
>  
> +	if (!data)
> +		return -ENODEV;
> +

If this is needed here, then why don't we add a similar check to
ibmpex_show_sensor()? It's also called by accessing the device's sysfs
attributes, and also calls dev_get_drvdata(dev).

>  	ibmpex_reset_high_low_data(data);
>  
>  	return count;

To be honest, I don't really understand the purpose of this fix. As I
read the code, either device_remove_file() waits for the file writer to
finish before returning and the code was already safe before (because
data is freed after removing the attribute files), or
device_remove_file() doesn't wait and the code is still racy even after
your fix, because then nothing prevents ibmpex_bmc_delete() from
finishing (hence freeing data) while the writer is still in
ibmpex_high_low_store() (after the !data check, but before calling
ibmpex_reset_high_low_data, for example).

Or am I missing something?

Does anyone know whether sysfs guarantees that device_remove_file()
blocks until all user-space users have called close() on the file?

If it does, then I believe this fix wasn't needed. It not, then I
believe this fix is not sufficient (it would shrink the race window
but does not close it completely).

-- 
Jean Delvare
SUSE L3 Support

