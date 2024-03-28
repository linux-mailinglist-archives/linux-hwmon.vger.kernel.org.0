Return-Path: <linux-hwmon+bounces-1583-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CA18903F0
	for <lists+linux-hwmon@lfdr.de>; Thu, 28 Mar 2024 16:55:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 493171C2E4D2
	for <lists+linux-hwmon@lfdr.de>; Thu, 28 Mar 2024 15:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B44612FF84;
	Thu, 28 Mar 2024 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vIobDKg2"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0525B12F5A4
	for <linux-hwmon@vger.kernel.org>; Thu, 28 Mar 2024 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711641306; cv=none; b=cMS9AuCcI3c9Sf7gzqGG2Dh6x0iaPLidlbtkrJ1AS7mz7QRApQ1X4Z5HxbkvToLwzo7XxD4FB+uCX7cXOrKkoIEcXfnqx3FaR5flu9yjH8OE6Q7Y+KZZptnT2fgK2/tPRhFiyUc4GL36XQLk2XEvdu5vi+4P620fjB2c0pgMARI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711641306; c=relaxed/simple;
	bh=R7bfIIh4/xk7LeALLFjm8pnnjWc59J54jmaQNWQ6v8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JveMZ7v6vgMFO/WL6rfs0Qr9SX8EsZqrq2yvML54ighi/g92dlmAeA/no4lQDluOoID08Iu5VpzRuerCDU7f38XjFiA2khBGIjBqHHkTjHLG4HTJhmFNQrPsiZAKaXGGhTnXjQ/7+ejGhEbH8IA7DYhwyYwFjwDo9rT1ZzqDaFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vIobDKg2; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d4979cd8c8so11045671fa.0
        for <linux-hwmon@vger.kernel.org>; Thu, 28 Mar 2024 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711641302; x=1712246102; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7bfIIh4/xk7LeALLFjm8pnnjWc59J54jmaQNWQ6v8E=;
        b=vIobDKg2mJtEsnwrSkLu1i9EWbYR+3ldCRncFsnCfIsouyxP/uZ3rtZSTseIM4ybJM
         cD7nPAwWUmBfaFY6ofDIvdTSwhi46ZinpXSFh1c+idTg8s0xHuUY/m4KbPisq4zTp98i
         3kk8Nr5vOi3uBUF4HtSWVMDLsijslFbYpTvZn9vZ3u9TNRHV8pZRXPufRTBY3cLQhAVH
         I4JBnSD4UpLEu0OVF4S5PM+KRrDMUuRYgKjZNau95ICoE0WXbNRHoEUdUjFAtf4j9cST
         NFK/SLKNgemSvpFgsylSQ7hYriM5HERFQofPE4BhYPqw+QFe+i/eyk4Kuo8PB/fnrfTg
         DdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641302; x=1712246102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7bfIIh4/xk7LeALLFjm8pnnjWc59J54jmaQNWQ6v8E=;
        b=Q65jnyShvqgKJV0RK8aYLntc7IGF6cOIoP4mGFPSTjbrzOASxniVFLySpG/ZiFoCOD
         nniLmN0vYFA5c7ZScAUaGQBEMJOb9ruetTPtWFJiBPWcc9cRgkNzGgXG498+Ex4sE75T
         8uT+Le2Lm2K2Jfp9qkponnPJVdyLEPHNeK8OusY/DMhvSNqkMxU3zfmAirooUvQn6m+j
         4MY8QKlS5MVXQ7Mj7OfqXCYzlYxNxpteiAa/qlmAf52FGP3YkcQ7O22Pgv/hFz337icu
         dYKlV5lMAEUUvqjTKjrXOuvsp04YshuerbdAlxoddaHvOwMpw/2PvNVJnGNkxxRXbD6q
         7bEA==
X-Forwarded-Encrypted: i=1; AJvYcCVxWYGmr5pG9ZtKWgBU1rXXvgUJOdC30FCQ07fNqvrXfvvrxJ1+aRE3Wcu0XuIcaGaiWwjLkWQ6px50tOz+T/Unkr/+xkbBpMLzaic=
X-Gm-Message-State: AOJu0YxN9bX1OdVwiqv/zupjlch/aZNXtdxGk31g9qwfz591cchGblbS
	h0RfE/qVPIcuJdI12Cr3YumX0e/6SADqlbJMeDw1v/8kEtrHr9wJXguL2bc5sH54tgUrDOuzU2V
	ZqeSYJfnafllPaQEDj73dHEtclCOGKIHVNo1B3w==
X-Google-Smtp-Source: AGHT+IF0/ESH95+U3ugXq1Ok8l0CIDGsN+Io0PuUxNLRneFUjMk4GFow/0Qf+aMkXpICnzlbyE7BpmzBEev1FOymhUA=
X-Received: by 2002:a2e:8807:0:b0:2d4:a06d:5ba with SMTP id
 x7-20020a2e8807000000b002d4a06d05bamr1198649ljh.14.1711641302030; Thu, 28 Mar
 2024 08:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327-regulator-get-enable-get-votlage-v1-0-5f4517faa059@baylibre.com>
 <20240327-regulator-get-enable-get-votlage-v1-1-5f4517faa059@baylibre.com> <20240328134744.2fc263b9@jic23-huawei>
In-Reply-To: <20240328134744.2fc263b9@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 28 Mar 2024 10:54:50 -0500
Message-ID: <CAMknhBGAL4m5RtQsLCOiSUofAGw89R2We9MDMzfvaT=5o-4M8Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/7] regulator: devres: add APIs for reference supplies
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Support Opensource <support.opensource@diasemi.com>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 8:48=E2=80=AFAM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Wed, 27 Mar 2024 18:18:50 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > A common use case for regulators is to supply a reference voltage to an
> > analog input or output device. This adds two new devres APIs to get,
> > enable, and get the voltage in a single call. This allows eliminating
> > boilerplate code in drivers that use reference supplies in this way.
> >
> > devm_regulator_get_enable_get_voltage() is intended for cases where the
> Maybe avoid the double get?
> devm_regulator_get_enable_read_voltage() perhaps?

ok with me

>
> > supply is required to provide an external reference voltage.
> >
> > devm_regulator_get_optional_enable_get_voltage() is intended for cases
> > where the supply is optional and device typically uses an internal
> > reference voltage if the supply is not available.
> >
> > Signed-off-by: David Lechner <dlechner@baylibre.com>
>
> In general I'll find this very useful (there are 50+ incidence

I didn't find quite that many. Still close to 40 though.

> of the pattern this can replace in IIO).
> I would keep it more similar to other devm regulator related functions
> and not do error printing internally though.

I did this because it seems like we could be losing potentially losing
useful information when something goes wrong making it harder to
troubleshoot which function actually failed. But looking into it more,
the regulator functions already print errors for many of the error
paths, so printing more errors does seem a bit redundant. So I will
remove the dev_error_probe() in v2.

