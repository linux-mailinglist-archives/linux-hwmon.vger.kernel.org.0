Return-Path: <linux-hwmon+bounces-14292-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJq2Lh2QC2rhJQUAu9opvQ
	(envelope-from <linux-hwmon+bounces-14292-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Tue, 19 May 2026 00:18:05 +0200
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD8B5745FA
	for <lists+linux-hwmon@lfdr.de>; Tue, 19 May 2026 00:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B27FB301BA72
	for <lists+linux-hwmon@lfdr.de>; Mon, 18 May 2026 22:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D97D539C632;
	Mon, 18 May 2026 22:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3Q3KQm6"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEBD395DBE
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 22:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142682; cv=none; b=F/Jx7c5rRjyqXVUhg/WlwLMdTfXfsU+e5ejRiDrfjmqDPfrxRJH+c9Imxnay1MTiPHC4db0nllrRaRbdEKseeqJlQZqt7TO3KM/yTgMXn51JH3N7n+2XSvVh2y7sRFFyScSnqCCgaKqOh+1V6xjNcPQMIQexVGlS19iQs72D/i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142682; c=relaxed/simple;
	bh=rwy9AaB+YZ2TxWZYUbWBAN5RIBxXVW8FYgve6/rXKyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bMv0HthtDwonaj9srAJ/RALR/TUBGDBjiCg9NR5rXRcRU27A/KAiUDklkyFRZU/l30eDWuSh6I6wZ6XkT/geCK3g06Ez6Mbnocd8hKDM6TG8I9GchAKgBVmonK9L5ATO9ekyEb1QAzrMos4+Kp2R+goC7SyeuA5kHMLPUUzaXoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3Q3KQm6; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f03d6cf77bso2906207eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 15:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779142681; x=1779747481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvAeM3G6bmkfm6f0wgfGcfgEROVq1lUgw+e1xbuFGjg=;
        b=p3Q3KQm6XaUwQa2NUL3KVOdeuTe3LAxUmXMs3Y0Xc2kjPHWKWn+Q9dqpXCvc3HaATH
         XnvbDLJMSOiIsyN3pHPgbU+LBSLhMlK2wGOVh4wGOm4yW1zhOxE7kQAMqCwbfRNHBTvR
         KMlL0yNOw4KXvCI3bd16RziOhhFcQNfUPWtxaQa+Oj+cgmKEdfJNN8eLJfrZT5lV9QKj
         VEFWqE6PQn6Ttj4R3HkXD79D34OiuzwWY5rV4vNSP5EQj7X8jslBQtzZiT+yjlmX5nR7
         +Z+o04RtoGX6k7v2S7g9B/MKLbYwCAqC2Goy/w/0aw3G9N/5C+yd2iZNmDKQ4Va0z3ve
         0BOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142681; x=1779747481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HvAeM3G6bmkfm6f0wgfGcfgEROVq1lUgw+e1xbuFGjg=;
        b=Fv3fwmTvDmeZYHQ1l+27sQZ5XDPa42xzjVRxGqcc7fkwQpgyrlvseQIliXBQyK6wq0
         FoUprPuRu83fWLMYxzKWiUTFUQdOkoCJ8IchuUdXs6Wiw9c0q+lfSC9Qqf2hqWpKueNG
         GS3Q6r3ZV6HcAHiGuxGmvgXT9E/KUREaIKu/eg4pK/jfIX8SemPJvR0dV85+vVNmGulH
         BJoWk7fCkn8gA+EVIOQllijOZMpnoPU0KYqaIwQg9tLR9htestMJ21AmXNai2er+Kbma
         qVCq9KZBMaU749LVsS/gYXAub6J2Ownt1crQvGOr5x1vBNzvFWf9SxgbMQRXYZaSo2bC
         rzmw==
X-Forwarded-Encrypted: i=1; AFNElJ9j9y9U2fP9QvMmcG5l/PjsChjcaw70Bn0lBpUkaBOatsIirq6GqiPWf9tUfj5Gg3LdlQWvukAj547vUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYr7AZWkHoy8yctGTfxFzXHk8JYiDUuzqrLxiZkkeMEgNxG03k
	WFxFRyN65XKtLNTJjHzpQk2mwFQybA094oCqf/Ru8sm5kLJJnwP4RwZI
X-Gm-Gg: Acq92OHz62PFihGLvzsSZiHch/UUsnQJYWD9GIJb7LyZqrfeZlUDE9fR+WLjQ4E4k7H
	qFY+/g9EOzQbRCwuGSXjgdlCoa5sEIuKR8p6xm0E9+QlkbeW0/stCdY+DmuacK0agwnzs+F7YQX
	Buh+RbnR5PG3Pq24982WTIQMfsEkvZikJEh30j2jI5+uYLvIVRRIYHrLgm/GwiMshnAwb+bueKj
	O/nTzglkOOO6lkZy5YDw++0kTSF66+tok6iUNHYJFdbvv7BUnYQunWpRsk3a5c5QXhe8Etlhgt+
	+RAg2a3K4qXPD74GO+aN7eNPLiHRQZ/u30wcsFmsMLKEf8LRRE2BJ9VIXdcOSwe6CNcfH9lzHie
	Te8/tPRv/PZcl1S3CNguOucFBX7V49D52mB9xFEvS4c7jZFmJJaInSpFoQ9RNf6TQZ++VeuO1Ey
	CY4IcpzameW/dr9Lakj9+twDrnZpgeTtEYAXn82SS2Fkz4zB4=
X-Received: by 2002:a05:7300:fb83:b0:2ed:2942:34ab with SMTP id 5a478bee46e88-3039818afb2mr7606381eec.3.1779142680596;
        Mon, 18 May 2026 15:18:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6c3sm18171998eec.19.2026.05.18.15.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:18:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 18 May 2026 15:17:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: bcm2835: raspberrypi-firmware: Add voltage
 domain IDs
Message-ID: <a3eba071-d969-4498-baae-77cee9b2ed78@roeck-us.net>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14292-lists,linux-hwmon=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-hwmon@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-hwmon];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 3DD8B5745FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, May 17, 2026 at 01:34:43PM +0530, Shubham Chakraborty wrote:
> Add Raspberry Pi firmware voltage domain identifiers for the mailbox
> property interface.
> 
> Also add the voltage request structure used with
> RPI_FIRMWARE_GET_VOLTAGE so firmware clients can share the common API
> definition from the firmware header.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

I'll need an Acked-by: from a maintainer to apply this patch,
or some other maintainer will have to pick it up.

Thanks,
Guenter

> ---
>  include/soc/bcm2835/raspberrypi-firmware.h | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> index e1f87fbfe554..975bef529854 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -156,6 +156,31 @@ enum rpi_firmware_clk_id {
>  	RPI_FIRMWARE_NUM_CLK_ID,
>  };
>  
> +enum rpi_firmware_volt_id {
> +	RPI_FIRMWARE_VOLT_ID_CORE = 1,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_C = 2,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_P = 3,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_I = 4,
> +	RPI_FIRMWARE_NUM_VOLT_ID,
> +};
> +
> +/**
> + * struct rpi_firmware_get_voltage_request - Firmware request for a voltage
> + * @id:		ID of the voltage being queried
> + * @value:	Voltage in microvolts. Set by the firmware.
> + *
> + * Used by @RPI_FIRMWARE_GET_VOLTAGE.
> + */
> +struct rpi_firmware_get_voltage_request {
> +	__le32 id;
> +	__le32 value;
> +} __packed;
> +
> +#define RPI_FIRMWARE_GET_VOLTAGE_REQUEST(_id)	\
> +	{					\
> +		.id = cpu_to_le32(_id),		\
> +	}
> +
>  /**
>   * struct rpi_firmware_clk_rate_request - Firmware Request for a rate
>   * @id:	ID of the clock being queried

