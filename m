Return-Path: <linux-hwmon+bounces-2269-lists+linux-hwmon=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-hwmon@lfdr.de
Delivered-To: lists+linux-hwmon@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DDF8D1EBE
	for <lists+linux-hwmon@lfdr.de>; Tue, 28 May 2024 16:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CB7D285E3B
	for <lists+linux-hwmon@lfdr.de>; Tue, 28 May 2024 14:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72D116F8F8;
	Tue, 28 May 2024 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WodM64QD"
X-Original-To: linux-hwmon@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91FB16F858;
	Tue, 28 May 2024 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716906364; cv=none; b=RQ7thp6mh21GphpHbvTqtZUcfYw7m9C4yEHk1LNURrpJB2C8o4poNcLLdwNBJ7bILKh8w2fA0oByadXnf83HgQBn94jb58HbI79NFX0h91pmZt78pzHp/IM00a5JjUi4rOKGlbNhVJNwpKNSZU8riOoVM4SPMqqtyCskxiir4xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716906364; c=relaxed/simple;
	bh=3dYtIFusPc428oBd4g4MYfiFcilDznYcerXIUBz8hNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJg/IA2hWiEVpaglGmZhRTJIiKEYPPIAErv2jWCytMzqJ2BGmGFuV4Yn2G/pu5hCwF/JESm4F8krA9YEedU58AJo/r/Jmu6YsliL/PTh2uPKTuLElCM1F/3ktIt6lfLekUEocRM7/a4rEFvt//mtjBJDE727CwUhmVu+ViFISbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WodM64QD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E47CC32786;
	Tue, 28 May 2024 14:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716906364;
	bh=3dYtIFusPc428oBd4g4MYfiFcilDznYcerXIUBz8hNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WodM64QDbtD2Agcq45DOJumqHudaZnCNTRzpDzPnRPf/ieSpxUw9z27HqKmyxdUn0
	 t7EpShE1/KyH9VnVZFkKcLN0PzilNj0jL17lY3eCADL6ytFHUf+iyi1P7oI9d7S9zP
	 NwuRMf7uuyU2VGP3ebvp1k/Bb3n2aLq77+XTtpKgVR2Z5JbW11bO2rl+C0aYhg0nUh
	 QjcHE3b60hbj187mtigW8y/OmlkQk97uwMh0EpuspsrxzjcdH3cSaGUmBZ3HjdlzRF
	 +RSMhmMfb4Tl+dSyAzA7DiSTICm4Tp+SvY2A2aadKmCEYfrkheYLWSdiR6al4Nghym
	 XYHvjNmdlQKbA==
Date: Tue, 28 May 2024 15:26:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Naresh Solanki <naresh.solanki@9elements.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: Add max6639
Message-ID: <20240528-frame-liqueur-7f37ecc0dad1@spud>
References: <20240528125122.1129986-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EHygdDbVgT6tr7rK"
Content-Disposition: inline
In-Reply-To: <20240528125122.1129986-1-naresh.solanki@9elements.com>


--EHygdDbVgT6tr7rK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 28, 2024 at 06:21:21PM +0530, Naresh Solanki wrote:
> Add Devicetree binding documentation for Maxim MAX6639 temperature
> monitor with PWM fan-speed controller.

Other than unneeded |s where your descriptions don't have any
formatting, this patch looks fine. That said - where's your dts or your
driver? A binding on its own is unusual.

Thanks,
Conor.

--EHygdDbVgT6tr7rK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlXpeAAKCRB4tDGHoIJi
0g4dAP4k+S3tFyalBRKB1PYHsAZmy4WUQcyyVrwF3Vao5e7JIgEA7KjfB0skqXwB
focCZ/19rjDXZw4vATfCuQSGoJIArQ0=
=cRrS
-----END PGP SIGNATURE-----

--EHygdDbVgT6tr7rK--

