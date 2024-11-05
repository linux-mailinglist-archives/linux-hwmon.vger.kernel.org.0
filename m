Return-Path: <linux-hwmon+bounces-4923-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 903409BD373
	for <lists+linux-hwmon@lfdr.de>; Tue,  5 Nov 2024 18:35:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51A762818ED
	for <lists+linux-hwmon@lfdr.de>; Tue,  5 Nov 2024 17:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42611E2619;
	Tue,  5 Nov 2024 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="I7zi7hNz"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060D11DA60D
	for <linux-hwmon@vger.kernel.org>; Tue,  5 Nov 2024 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828097; cv=none; b=hXLUeyF83NxCIVhZEkarWbQ4jXyyEjX9P9zKwVci0GCpX35+nZrKWBz7U7XOvEs7c0Rn9N/P0HEWiBMK6MtsKXkAjs1X6tyLpID9nV2GJRVGgI124n3bAxgFFxuoZ7b7eVdMKFK/ogLdmBjO7TOExWYlC+fKhgnQKP1wvxAeRts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828097; c=relaxed/simple;
	bh=QUJBA/PvSq+g5bGHrQF9BKgsZJva/eZtagz1QwrcLhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jaGtIPyMSr+dZ736rtjJLjMyPyRf8kS8cSYXO++yY6pyrKiJplA48L5Uy5wRE4/s3chBhfchIar/l8VsPFPeuRtAKa11I4MzumA8C/rt2c4MiO0/sAkALOHhjaT1/NvPyw82cuw7UeJMBbFaAJSjzGhQF9bwYlisN6d9klMH6Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=I7zi7hNz; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e30fb8cb07so4142109a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 05 Nov 2024 09:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1730828095; x=1731432895; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SpVxQLLNLfLph3m6EIkv3r8u00CnaqvwEZ6ejt8Iwfo=;
        b=I7zi7hNzmSwjEdyituC7WADZnD3vF7O4WflxjWSwHwVkXO8GrIuP6yu3C2Z15ADm7O
         gcQw44g5MyIfxEONTPmDvL5lRC4XLvxCYy8E+oM5COekt7Znw9rVNBzWJcI0n7hksvUK
         li9b/WyR6a8TlMn+MZdbqX+uTpttu+g10tsUNIlDcFy72tb0PPi3p2z0Z0IcMVHWjYFn
         7a372j8snhOzyd8w/582hhC4QcxYlXLPXmofhIfdRNNv8w7HUi69YeXKxBwypP1Km8bR
         A+lxSwNZe9ETMuqXmj4Hr3YI/fXgYRkJklxjG7toQrz1JzS7+6KpArL8k1rv/I5p9Nq+
         V6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730828095; x=1731432895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SpVxQLLNLfLph3m6EIkv3r8u00CnaqvwEZ6ejt8Iwfo=;
        b=hKaOsBADyXrV/S+DXE3/Ch+K6q3GJTZrVfMYcpc2KpnMYpLl2U/4TRKbG0H4eQIJYD
         0OeLz8I2zFeIn3Pj/U9WbGJa5DWbR9+oy4c8K1EnIWiMVeFvcGeN+4jrryzn55yMzPeA
         S8NW1Fgb1u8FwW9Ntl76St3GPCNKAVPpM5pV1vmMrlVD91VhXEvCOVobkIFzwwB8GuyJ
         Qp9PwUyXyi4UC6H1+yMaAoc+iMc6PLVcTCmmSjD5i7n2IRXgLECObF9KvbGxAX8gHYme
         pPZ6CxW3NNezeq6oFBqhNVT9UhvcYM8fD+JGdtJ11fbL/PuPW4dKa4uh2929uYHyG9pl
         U7EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhg7qQT3GL6howbp3fWy0jItZOqcrd+CYRiil9yMBQWzELUwM4Wwe6GCc69+gP1PdUo7pSEP2Ncqy3qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCzXV6hEOkGGMTo5MfxBVv9bZ3l4tRL5L6l9rIH6vcxjx9PEcw
	T8foinR9aOIl0cHwH2D8lbF6bZe7134lO9MfpYIMsR/tSXUojqQxlxmhrGwcJYUsD0sf1OP+lnZ
	rvteo73M+k/F5olTMFjdHkCeL35RRrgly/2jCow==
X-Google-Smtp-Source: AGHT+IH+bA1GiURFitv8kWYaSx/RW5cqeoyKLHZlSyIHFiiS2c0gxrHtSJy3vziWV/X5vWRNJ0DWzAshOtbMqV8BLE0=
X-Received: by 2002:a17:90b:3581:b0:2e0:7b2b:f6a with SMTP id
 98e67ed59e1d1-2e92ce710a9mr24650088a91.17.1730828095207; Tue, 05 Nov 2024
 09:34:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241104092220.2268805-1-naresh.solanki@9elements.com>
 <20241104092220.2268805-2-naresh.solanki@9elements.com> <ac9698862598f0d09d35872d0e091537f822fbcd.camel@codeconstruct.com.au>
 <CABqG17j8RhFpNV+nJ=nLY8+uO_XXjbN55+Ce8op=6Dj5Z=_WOA@mail.gmail.com> <7d9657ff-1c4a-4167-982a-9f07e7b51f77@roeck-us.net>
In-Reply-To: <7d9657ff-1c4a-4167-982a-9f07e7b51f77@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Tue, 5 Nov 2024 23:04:44 +0530
Message-ID: <CABqG17i51TnPhAKKEAVYMXfqem9XWeNJuwzgLiYB81uCs0n91A@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] ARM: dts: aspeed: sbp1: IBM sbp1 BMC board
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jdelvare@suse.com, sylv@sylv.io, linux-hwmon@vger.kernel.org, 
	Joel Stanley <joel@jms.id.au>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew, Guenter,

@Andrew Shall I resend this patch series along with dependent
dt-binding patches ?

On Tue, 5 Nov 2024 at 21:17, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/4/24 20:10, Naresh Solanki wrote:
> [ ... ]
>
> >>  From a spot check, the warnings seem legitimate. Did you send the right
> >> patches?
> > Just checked again. They are resolved. But I guess the dtbinding patch
> > for the above warning are merged in hwmon-next branch & not in dt/next
> >
>
> Did I apply some patches which should have been applied elsewhere ?
I think it should be fine.

Regards,
Naresh
>
> If so, please let me know, and I'll drop them.
>
> Guenter
>

