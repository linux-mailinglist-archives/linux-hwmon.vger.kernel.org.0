Return-Path: <linux-hwmon+bounces-7428-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEA3A73264
	for <lists+linux-hwmon@lfdr.de>; Thu, 27 Mar 2025 13:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77B363B8FC4
	for <lists+linux-hwmon@lfdr.de>; Thu, 27 Mar 2025 12:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234E62144A7;
	Thu, 27 Mar 2025 12:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NGP58XlI"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480B620D514
	for <linux-hwmon@vger.kernel.org>; Thu, 27 Mar 2025 12:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743079313; cv=none; b=dNHcC5aAuAWlZ4DgLmRWCr7S4Yao/XTu1KIp2OjZyCjVzvQKZptUkJ/EYvolxAKLPVc8BRFfgP3ThvQ0S6svG4YlCIxQL1xiCrDaA8hn0HibX99q7Q5lqiozBr6CCgEs8y16YpaQ8hxnR3Fr45GZlZKClCmuQWTBhgx4kN1mAvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743079313; c=relaxed/simple;
	bh=rTUk5WsXR6uaQmtmVpjNHsbtIr+WlFlJncQhJeTUUpU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=knoTWEDB4mz6q1xhALuDu+c2h2u5qKH1JOT9QGZv26F4BLM30UFjQOZs6mP42Az3o/F274JSh8Dqu6Kh0SEVDwsC2w/FK0fTKh+opsQDuwkKEPgmAiDL9NcmsJM8ef5naXTfCuXwflgSnYJ6brjtBuVjuc6qS/keLQjRCn8ZkiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NGP58XlI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso6802095e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Mar 2025 05:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743079309; x=1743684109; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTUk5WsXR6uaQmtmVpjNHsbtIr+WlFlJncQhJeTUUpU=;
        b=NGP58XlITYgewmnUz3C5CEsnJ90a7XtwoWFh2GZRC4H3o+r8nni8xsVysctoNM0pDx
         eKLdB7bYq09MnHMo+018Ng6T6Bd+sYQMLEsYCNkGqxcwqWXLG32UscFqrWZnOocQMM1r
         zIbBGUoWg/axjCUrNJqRKR86xNI/Er/23e1YAp5XgaPBlbtjpaFPorQdreacKWPf4wi9
         4cfv+wBWSjPDXz9noy5kN/v6ujGHrxGqxvHAY9SNTkHwrtGeu4zLIRbEia+3sFN/Bwd5
         Ar29oFRc/nqfYVT7ljk8skQU2EA2ovUAXXnZioCL50q85XYALdu7pXFpusK+B8Ywj87S
         jRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743079309; x=1743684109;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rTUk5WsXR6uaQmtmVpjNHsbtIr+WlFlJncQhJeTUUpU=;
        b=XFQV40qi3T0tzRlbm6Ov4bpzHac3VpQd1I4zwYoRRyQNa5DdSsrU5Sv+wwhUBqd/GI
         wxJwcwceQDp+O3kZ0jXZBJaBzzTxzq+cfZsfjupoymOyFx6iojsOJbvmKH+Ux7ThjxrK
         IttpVHywJFB/Kh5tFkSjEGV93PHtNAgOtRbaiJlVswlMLE2zTg1Q8f9tAeyztN4iuLdT
         L4kfiPNFsMYZczCTb6ZCMHWLC7ndJ7prPDTQk4PuC3YbH713sZEpYs9DDQxEoFFisR1n
         VOg14dHVyqX5hHqfI6ISZtVLFobTtUm5klXogbJDlr2Zx4R5jVtxXVBRLyv8jHJ+yGZu
         aH1A==
X-Forwarded-Encrypted: i=1; AJvYcCUCDgxa3IbxMIZpHcgcBcRQuqddj9P43DMkDGcZgxX440cZPrqrtpnHF6pd1z0wwSLfyfBbssiKyh94eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaY2MtAg6mxZdfSNT/GbHGUHp4j+M6mYZJTXBddKltVoqGt+cA
	5JgrKMDgUnouausMF9Y8QTCF5aIrfaNiHb3sLVS4mSNnaQosEKtPJW+F1gI00IY=
X-Gm-Gg: ASbGncuu0wcFyWQ80GWM0/CPZN6lVuW/Rp4pLbviAL8qJ6XA7R1UVMvFuV3R0I/7BEk
	ccBNggwNYkgEV5UavH5fyqCqGK96WtpGQw1xxsTSyqUsgyWQnpkSzxZUWGMJeCid7oWe1MLjqd1
	PTxmxP50bCZVOiexZ0bMuUjY2At/sibmM9X08QFqq4g4OKrubrCKb2atOfxfXHVcoWs8c2RT2FA
	kqX8r609CUuzTeBPJp2lbPbeD4MCJNhMYP1sww6+0MF2qzZSFzwzkNw05gnSK1CZXOou2QXe+VW
	J0JcTiE3/olpPhHNpLJIllbnZehT8o67feWdY0hCYtcNI8mmTg==
X-Google-Smtp-Source: AGHT+IGWrkmnwwYBa5Bvx8VGNmhRtptYZl223u01AmKMJ5pNwx5tLvmrcvvV5SU1hmSMut9pH5TgMA==
X-Received: by 2002:a05:600c:4f94:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-43d850fd6aemr35034475e9.18.1743079309513;
        Thu, 27 Mar 2025 05:41:49 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dedea3sm39373785e9.3.2025.03.27.05.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 05:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Mar 2025 12:41:48 +0000
Message-Id: <D8R21NO1IN43.1E4FD7KG9Z4KI@linaro.org>
Cc: <srinivas.kandagatla@linaro.org>, <lgirdwood@gmail.com>,
 <krzysztof.kozlowski@linaro.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <jdelvare@suse.com>, <linux@roeck-us.net>, <linux-sound@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] ASoC: codecs: wsa883x: Implement temperature reading
 and hwmon
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.0
References: <20250107114506.554589-1-alexey.klimov@linaro.org>
 <3e08b501-f8d0-4e68-874e-b578e7c82c47@sirena.org.uk>
In-Reply-To: <3e08b501-f8d0-4e68-874e-b578e7c82c47@sirena.org.uk>

Hi Mark,

On Sun Mar 16, 2025 at 11:33 PM GMT, Mark Brown wrote:
> On Tue, Jan 07, 2025 at 11:45:06AM +0000, Alexey Klimov wrote:
>> Read temperature of the amplifier and expose it via hwmon interface, whi=
ch
>> will be later used during calibration of speaker protection algorithms.
>> The method is the same as for wsa884x and therefore this is based on
>> Krzysztof Kozlowski's approach implemented in commit 6b99dc62d940 ("ASoC=
:
>> codecs: wsa884x: Implement temperature reading and hwmon").
>
> This doesn't apply against current code, please check and resend.

Just for reference and for future, what should be the base for patches?
linux-next or specific repo/branch in audio asoc?

Thanks,
Alexey

