Return-Path: <linux-hwmon+bounces-12794-lists+linux-hwmon=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IC1JFPE1xWn/8AQAu9opvQ
	(envelope-from <linux-hwmon+bounces-12794-lists+linux-hwmon=lfdr.de@vger.kernel.org>)
	for <lists+linux-hwmon@lfdr.de>; Thu, 26 Mar 2026 14:34:41 +0100
X-Original-To: lists+linux-hwmon@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7443360A9
	for <lists+linux-hwmon@lfdr.de>; Thu, 26 Mar 2026 14:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B2F731BD136
	for <lists+linux-hwmon@lfdr.de>; Thu, 26 Mar 2026 13:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10E031F9A6;
	Thu, 26 Mar 2026 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibE07/j0"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC78310652
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774531474; cv=none; b=AyVXebNhDTefoBxCTpozswpKBlaSoUzySE/TBRF+DVDBtiGQaqpKoZ3oIdgYZjkwltjXAI8fOVCHg0DCg9uDM+jUoYMC94wYSF3aTKNwb/JXgj3UqN5NSkL484HAshDC1MlGkYWukyxpTyXBUZDKLOLRlH+srSV18SIo1jufFPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774531474; c=relaxed/simple;
	bh=CnK9MtHN0234D7GqkV3ym/FoMPAlFj2ThVu4EdpcdvE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chHbBQmKnDKgiswhha4Boau+PuYQ6S5Lz5QM11bioSYSB7WLYh8SXFYyMcRkRiDroIvZKiulcoKsWQYaw3+CHyrP4iLNONHyHmjITfor9R0HC7Rd/ZhxhOF+WQEBbJk8FgCIm8sPDnTS/seSphI+NlORZq2CnCWBzdhYn6Uatkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibE07/j0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F58C4AF0B
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 13:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774531474;
	bh=CnK9MtHN0234D7GqkV3ym/FoMPAlFj2ThVu4EdpcdvE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ibE07/j0gZvqjZfC4EqbxmTs4ytX8JLXcShsh2JEOpCQYmmD6XtZjvgDIwi+IvDKt
	 Kkq81tS6Y/WmvxCKzBgqgtPolBKYT/7FQJmV3ieejIoY80Q+LxQaxZE/B/Fg3bw0UN
	 K5G0PTmCizk6XbiE7F+TbANVDJPXP6bbwNTtn7rHehzLbITC8ebIcqXJ7CeN9NBA3E
	 Ks/BKy3RQV7V7f52KaHs/ACN5UdgSQumOZS8HPmVYmf9t+y5TIMgSX8q7ZIQ1crUFT
	 2pvxg//eBZ4AtVeA+qbYHRKLxvRi3xpIQVItZWiJJdL9njpZqAGR132jZjH1GSuNoV
	 cx8DEaDf6Bfxg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38be5e86918so8578191fa.3
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 06:24:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlV2nUQ5TF8+X3bdjtK/Y8d6tSzrp8053zj/5NUflbExMYbkWbS5UFKsqf+Ei+znuNbSH7kxzWaRTzCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWXS/jMag+cEUPfe2r8n6jtwEB+V5JtxpptbjjlS/Anw/gJwyy
	1LmsYbBkHGcm/z6dMKdHI+y/Q0xZhE/BYUAfT4DySdjssit5pzShXlal/VvKdcWxIr6lP6g9OEY
	wfz6AVvbtQAbI+mEgL9grwpBe6x4f/nFgNS1gN1lmMg==
X-Received: by 2002:a2e:8a89:0:b0:38c:6bd5:8f49 with SMTP id
 38308e7fff4ca-38c6bd5917cmr1049801fa.32.1774531472895; Thu, 26 Mar 2026
 06:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326-drop-ina2xx-pdata-v1-1-c159437bb2df@oss.qualcomm.com>
 <a4661a50-1419-458f-a0f9-a9d9f6f59177@roeck-us.net> <fd613c1d-c9c0-464a-ab1f-16bfe20e122d@roeck-us.net>
In-Reply-To: <fd613c1d-c9c0-464a-ab1f-16bfe20e122d@roeck-us.net>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 26 Mar 2026 14:24:20 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfYixLYcYz20dv9Afek77b3cqQh7nne93WLOusHnyJKMA@mail.gmail.com>
X-Gm-Features: AQROBzA5T82HOaCThzHhDQ44Ge-QyqCVfWnB80RRN06zm_lqqsCjSYEP9Jp5Z8M
Message-ID: <CAMRc=MfYixLYcYz20dv9Afek77b3cqQh7nne93WLOusHnyJKMA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (ina2xx) drop unused platform data
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12794-lists,linux-hwmon=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-hwmon@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-hwmon];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,roeck-us.net:email]
X-Rspamd-Queue-Id: CE7443360A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 12:33=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On Thu, Mar 26, 2026 at 04:28:16AM -0700, Guenter Roeck wrote:
> > Hi,
> >
> > On Thu, Mar 26, 2026 at 10:30:00AM +0100, Bartosz Golaszewski wrote:
> > > Nobody defines struct ina2xx_platform_data. Remove platform data supp=
ort
> > > from the drivers which still have it (it's effectively dead code) and
> > > remove the header.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.=
com>
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> >
> > Thanks a lot for your patch. Checkpatch complains:
> >
> > CHECK: Alignment should match open parenthesis
> >
> > No need to resend, I'll fix that up.
> >
> > Applied.
> >
>
> Ah, no, I can not do that. You also touched drivers/iio/adc/ina2xx-adc.c,
> meaning I'll either need an Ack from Jonathan or the patch will need to b=
e
> split.
>
> Guenter

Yes, sorry I should have mentioned it. This should go through the
hwmon tree with an Ack from iio maintainers.

Bart

