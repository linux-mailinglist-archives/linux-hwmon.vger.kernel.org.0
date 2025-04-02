Return-Path: <linux-hwmon+bounces-7482-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3B8A78A09
	for <lists+linux-hwmon@lfdr.de>; Wed,  2 Apr 2025 10:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C46D7A3B2C
	for <lists+linux-hwmon@lfdr.de>; Wed,  2 Apr 2025 08:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC3023315D;
	Wed,  2 Apr 2025 08:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="0w/JBWhE"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5852E337B
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Apr 2025 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582803; cv=none; b=ZObG/fzL9CUbcIrRN4hHg0lHU3HnH65PnrJSSSzkcbAOHMSQgNC24FJBDh1eASheVii549q9S4QX5TAAPZtJGtx2AzFPIsVPtHY1kvNe1I0Cy5ide1fIo18dVO+5FPZdPmHLg3qQ1LxcEE9Xw2tl+ewfqKfXvC4a576K92pOHTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582803; c=relaxed/simple;
	bh=rarRiwBT0Clf3tqnhxdPEnRPmTTIuWDxCnJGuk7ONYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3HInKBREWfHrN1XbScgIG9jl4ph3+BAeklTozyHcu/o0WjalGK5feNgtU1KFEt+yPGBnAhcelrAYTCrnBCtCOVV9nLRZ6k0owSuDRwbb8i50MPxOoXUK5nPcHRmaqLYc0p1UZi/AE7P9ji+2B8i4XzcWDOw6azRXzNfQY8AKrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=0w/JBWhE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2240b4de12bso109947255ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 02 Apr 2025 01:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743582801; x=1744187601; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zbCN7/36D6rNO+6WczUGmYkS2wWeNOSiv+dD5fzbc8=;
        b=0w/JBWhEKtDNHRvInQ0UuKd4P3KemrSIuPl/BJ+wu6L/YfA4BLmUfc5u+dsCVint4h
         /623jmW2MldCXMpjMWilRSNUG/B/Tf4EtvIRlF48Yvqe4G+EeLpmCf5sqvvO/ZoSq042
         18rVIxkZXAmaeHLfhW+rr6EWBT4dTZLx15bNFQGxiyimVZg+SXO7l1hmOK3MianRHBR+
         GF1qv+q1c4PDq9AQJ5PCAIKUDbtjZzrfPQzT7OamvhQzRb1AJGvNfH6o1URLYjXgwN4m
         I8hqa0Vgy/lU9k3pfVWGW0uoTMmjkkM51T53n5rzzWyUBc4Zw8rcCgZZaFQ63TL42IkX
         aNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743582801; x=1744187601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4zbCN7/36D6rNO+6WczUGmYkS2wWeNOSiv+dD5fzbc8=;
        b=DXS75jOiP+96hHkJoo6UIL5iVkmWAFo/xUZFugXUNlvX4vio/MflJbiHoQzBYY4sKH
         nZ4SPP6n8KWsMW9JehLcqr4/uCsBDKVJQAB7KTgY15PMf2K8a2EROKstMukI+P/cwaQc
         6pImSxdc3Gsg5zW1YKs0AOzb8pyDchKJ6nT8acj4rTW0xw/TzTLrp300h6wiLv3r8Zvs
         LOHeMKgkmoc2ftaen/cchKTNP/VeTZSbKzXyaaRnLZv+llmKIdnKaxAB3YT3nYOxDMSt
         jqLgbb8rgyay388Ora4wmjTmDvMnrLULxAfogWG1SpdPsRujzlR+L/7TmJu9LkvKtfw9
         FQWA==
X-Forwarded-Encrypted: i=1; AJvYcCVuuOmIwXSPXRZNblMUo/It9dVHzKtTAriDOtmkWOgIOKdEXm+VNOUZZqGYiRNYlTzLcrDuFOhguohnYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3M9spCHaOF08WfRwAtfwUZzDK6+R9XasC3izymLjLYMU0phvN
	QTbH/a9D3e8B4G5n/CpnDOXwm/FyaYeHgRpZaG8OaVsdvC1PVXL36MaXCunOaieDagZTvzAb4ta
	4JFBxQCi5BWfUAc5nWLm7bZixZ/+NZgwx9xoRPw==
X-Gm-Gg: ASbGncv8TGpJtMkLslNaD/bwCw9222olhKAiYe/3sXGHGHtW8gxKd15jUZzDeA+npwo
	UrwSQTAQ5cYee5dyxnCBdLqaY3//1goGj5+VkFVX+a4tYQv71AOAvVBItJKa6dSkEXHArD9PakR
	CEr3DGzeqWkqbpjfAZ7fbvYRZfj7hW
X-Google-Smtp-Source: AGHT+IECa8vOuJWn11iMEwGLRvcjY2DqXsAj8ZLW6d2RQCfllK6etY+RQclFt1PkiFw09dKf5UneNsfK41PQ0Wlc4Kg=
X-Received: by 2002:a05:6a00:2e18:b0:736:a973:748 with SMTP id
 d2e1a72fcca58-739804484admr23046777b3a.22.1743582800678; Wed, 02 Apr 2025
 01:33:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401220850.3189582-1-william@wkennington.com>
 <5a602ffc-5cbb-4f39-b815-545f3f1f4c98@roeck-us.net> <CAD_4BXgzvFavEcfhY5_BEi9y6pK0wJ1q4oqFYC5ctP53c57=wg@mail.gmail.com>
 <84d37c25-197b-44b4-b181-f71f5e8b81d8@roeck-us.net>
In-Reply-To: <84d37c25-197b-44b4-b181-f71f5e8b81d8@roeck-us.net>
From: William Kennington <william@wkennington.com>
Date: Wed, 2 Apr 2025 01:33:08 -0700
X-Gm-Features: AQ5f1JpF0TbFppZlbdINtj6p3CO4yPycwcUeh0ZCC6cwfVlwY364gxiKVFB1nzE
Message-ID: <CAD_4BXhUVRpNjORSHYiwhxXAGbAv5=4SYekWZhK+r9Wi=n5+Lw@mail.gmail.com>
Subject: Re: [PATCH] hwmon: max34451: Workaround for lost page
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 5:19=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 4/1/25 15:55, William Kennington wrote:
> > On Tue, Apr 1, 2025 at 3:52=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> >>
> >> On 4/1/25 15:08, William A. Kennington III wrote:
> >>> When requesting new pages from the max34451 we sometimes see that the
> >>> firmware doesn't update the page on the max34451 side fast enough. Th=
is
> >>> results in the kernel receiving data for a different page than what i=
t
> >>> expects.
> >>>
> >>> To remedy this, the manufacturer recommends we wait 50-100us until
> >>> the firmware should be ready with the new page.
> >>>
> >>> Signed-off-by: William A. Kennington III <william@wkennington.com>
> >>> ---
> >>>    drivers/hwmon/pmbus/max34440.c | 7 +++++++
> >>>    1 file changed, 7 insertions(+)
> >>>
> >>> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max=
34440.c
> >>> index c9dda33831ff..ac3a26f7cff3 100644
> >>> --- a/drivers/hwmon/pmbus/max34440.c
> >>> +++ b/drivers/hwmon/pmbus/max34440.c
> >>> @@ -12,6 +12,7 @@
> >>>    #include <linux/init.h>
> >>>    #include <linux/err.h>
> >>>    #include <linux/i2c.h>
> >>> +#include <linux/delay.h>
> >>>    #include "pmbus.h"
> >>>
> >>>    enum chips { max34440, max34441, max34446, max34451, max34460, max=
34461 };
> >>> @@ -241,6 +242,12 @@ static int max34451_set_supported_funcs(struct i=
2c_client *client,
> >>>                if (rv < 0)
> >>>                        return rv;
> >>>
> >>> +             /* Firmware is sometimes not ready if we try and read t=
he
> >>
> >> This is not the networking subsystem. Standard multi-line comments, pl=
ease.
> >
> > Okay, let me fix that.
> >
> >>
> >>> +              * data from the page immediately after setting. Maxim
> >>> +              * recommends 50-100us delay.
> >>> +              */
> >>> +             fsleep(50);
> >>
> >> I would suggest to wait 100uS to be safe. The function is only called =
during probe,
> >> so that should be ok.
> >
> > Yeah, I don't think they did strenuous measurement of these values on
> > their end. We have been using this patch for 4-5 years now with
> > seemingly good robustness on the 50us value. I just pulled up an old
> > email from the vendor that gives this context.
> >
> >>
> >> Is this a generic problem with this chip when changing pages ?
> >
> > I believe that is the case, but this patch is pretty old at this
> > point. Is there somewhere to add in quirks for such chips that would
> > allow us to build in such a delay?
> >
>
> So far we only have delays for all accesses and for write operations.
> See access_delay and write_delay in struct pmbus_data. If the problem
> only affects page changes, we might have to add page_change_delay or
> something similar. Alternatively, maybe we could just set write_delay.
> If the chip has trouble with page changes, it might well be that it has
> trouble with write operations in general.
>

So I did some digging and asked the original contributors to the
patch. It would appear that it's specifically an issue with this IC
around page switches and not any arbitrary write command. There is an
issue where it does not correctly respond to the second command issued
after a PAGE switch occurs, if the commands come in too quickly. They
believe it's an issue with max34451 (and other derivative ICs) not
correctly clock stretching while the PAGE command is processed.

Let me know what approach you would prefer to take here. It seems like
it would be most optimal to have a quirk specifically to delay
commands after a PAGE.

> Thanks,
> Guenter
>

